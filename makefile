all: clean setup

clean:
	$(RM) -r pox3.egg-info/ dist/ build/

setup:
	python3 setup.py sdist bdist_wheel

upload:
	twine upload --repository pypi dist/*
