"""
What this script does
1. Reads the "xrdb -query" values - so we can have system color mapping
2. Reads the raw_config_dest config
3. If there is "$value" in raw_config_dest and "value" mapping exist in xrdb replace the $value with xrdb counterpart.
4. write change to dest_config

e.g.
raw config:
[[block]]
info_bg = "$*color0"

xrdb -query:
*color0: #ffffff

results in config that have:
[[block]]
info_bg = "#ffffff"

"""
import subprocess
import re
import argparse

XORG_VALUES_CMD = ['xrdb', '-query']


class EqualPathsError(Exception):
    pass


class FileEmptyError(Exception):
    pass


class XorgReader(object):
    def __init__(self):
        self.kvalues = self.get_xorg_values()

    def get_xorg_values(self):
        _kvalues = {}
        _raw_list = self._get_raw_xorg_values().split('\n')
        for entry in _raw_list:
            _kv = entry.split(':')
            if len(_kv) == 2:
                _kvalues[_kv[0]] = _kv[1].lstrip()

        return _kvalues

    def _get_raw_xorg_values(self):
        process = subprocess.Popen(XORG_VALUES_CMD, stdout=subprocess.PIPE)
        return process.communicate()[0].decode('utf8')


class ConfigReplacer(object):
    def __init__(self, raw_config, dest_config, replace_values):
        # pretty shitty to open this here but oh well
        if raw_config == dest_config:
            raise EqualPathsError()

        self.raw = open(raw_config, 'r')
        self.dest_config = open(dest_config, 'w')
        self.kvalues = replace_values
        self.regex = re.compile(r'"\$([\w.*]+)"')
        self.replace_values()
        self.close_files()

    def replace_values(self):
        self.raw_read = self.raw.read()
        if not self.raw_read:
            raise FileEmptyError()

        matches = self.regex.findall(self.raw_read)
        for match in matches:
            _replace_value = self.kvalues.get(match, None)
            if _replace_value:
                _find, _replace = ''.join(['"$', match, '"']), ''.join(['"', _replace_value, '"'])
                self.raw_read = self.raw_read.replace(_find, _replace)

        self.dest_config.write(self.raw_read)

    def close_files(self):
        self.raw.close()
        self.dest_config.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('raw_config_dest',
                        help='Your raw config dest with $value entries that will be replaced with')
    parser.add_argument('replaced_config_dest',
                        help='Where to copy replaced config')

    args = vars(parser.parse_args())

    ConfigReplacer(args['raw_config_dest'], args['replaced_config_dest'], XorgReader().kvalues)
