***********
PyPy Upload
***********

This document walks a user through the process of uploading a Python project to
PyPy

1. Update pip

   For Linux Mac/OS

   ``python3 -m pip install --upgrade build``

2. Create the build

``python -m build``

This command will generate another folder titled ``dist``

3. Create an account on `TestPyPy <https://test.pypi.org/account/register>`_

4. Install twine

``python3 -m pip install --upgrade twine``

5. Once installed, run twine

``python3 -m twine upload --repository testpypi dist/*``

When prompted enter your username and ``__token__`` for the password.

Once uploaded it should be available to view at ``https://test.pypi.org/project/your_package``.

6. Install package for test on your computer.  First create a virtual environment
   and type
 
``python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps example-package-YOUR-USERNAME-HERE``

6. Once the test PyPi example is successful, you are ready to upload it to PyPi.  To do so
   follow the example on `PyPi <https://packaging.python.org/en/latest/tutorials/packaging-projects/>`_
