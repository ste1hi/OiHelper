.PHONY: build install release clean clean-file lint test

build:lint test
	python -m build

install:build
	pip install .

release:build
	python -m twine upload dist/*

clean:clean-file
	pip uninstall -y OiRunner

lint:
	flake8 OiRunner/ tests/ --count --statistics --max-line-length=127
	mypy OiRunner/ tests/

test:
	coverage run --source OiRunner -m unittest
	coverage report

clean-file:
	rm -rf dist build *.egg-info htmlcov .coverage .mypy_cache OiRunner/__pycache__ tests/__pycache__