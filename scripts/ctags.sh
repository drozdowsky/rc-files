uctags -R --fields=+l --languages=python --python-kinds=-iv $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") ./
