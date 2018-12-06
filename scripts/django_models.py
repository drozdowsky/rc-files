import django.apps


def related_info(field):
    if field.related_model is None:
        return ''

    start = '===========>'

    if field.__class__.__name__ == 'ManyToOneRel':
        start = '<==========='

    return '{}\t{}'.format(start, field.related_model)


def main():
    with open('django_models.txt', 'w') as f:

        for model in django.apps.apps.get_models(include_auto_created=True):
            f.write("'{}'".format(model.__name__))
            f.write('\n')
            f.write(str(model))
            f.write('\n')

            for field in model._meta.get_fields():

                f.write('\t')
                f.write(field.name.ljust(40))
                f.write(field.__class__.__name__.ljust(25))
                f.write(related_info(field))
                f.write('\n')

            f.write('\n'.rjust(155, '='))
            f.write('\n')


main()
