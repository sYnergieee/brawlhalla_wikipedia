FROM python:3.10
RUN mkdir /resource
WORKDIR /resource
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt
RUN python -m pip install -U pydantic pydantic-extra-types pydantic-settings phonenumbers pydantic[email]
COPY . .
CMD cd src && uvicorn main:app --host=0.0.0.0 --port=8000
EXPOSE 8000