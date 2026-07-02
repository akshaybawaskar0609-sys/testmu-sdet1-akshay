# AI SDET-1 Assignment – TestMu AI

## Overview

This project is developed as part of the AI SDET-1 assignment.

The project demonstrates:
- Selenium UI automation using Python and Pytest
- Page Object Model (POM) framework
- Prompt engineering for AI-generated Gherkin test cases
- AI-powered failure explanation using Google Gemini API
- API testing using Python Requests

---

## Tech Stack

- Python 3.13.2
- Selenium WebDriver
- Pytest
- Requests
- Google Gemini API
- python-dotenv

---

## Project Structure

```
testmu-sdet1-akshay/
│
├── generated_tests/
│   ├── login/
│   ├── dashboard/
│   └── rest_api/
│
├── pages/
│   ├── login_page.py
│   └── dashboard_page.py
│
├── reports/
│
├── screenshots/
│
├── tests/
│   ├── test_login.py
│   ├── test_dashboard.py
│   └── test_api.py
│
├── utils/
│   ├── config.py
│   ├── driver_factory.py
│   └── llm_helper.py
│
├── prompts.md
├── ai-usage-log.md
├── conftest.py
├── pytest.ini
├── requirements.txt
└── README.md
```

---

## Features

### UI Automation

- Login automation using Selenium
- Dashboard validation
- Page Object Model implementation
- Pytest fixtures

### API Testing

- Sample REST API validation
- Status code verification

### Prompt Engineering

Generated Gherkin scenarios for:

- Login Module
- Dashboard Module
- REST API Module

Each module includes:

- Prompt Version 1
- Prompt Version 2
- Generated feature files
- Improvement notes

### AI Failure Explainer

When a test fails:

- Screenshot is captured
- Failure details are collected
- Information is sent to the Google Gemini API
- AI generates:
  - Root Cause
  - Explanation
  - Suggested Fix
- The response is saved in:

```
reports/llm_failure_report.txt
```

---

## Installation

Clone the repository.

```bash
git clone https://github.com/akshaybawaskar0609-sys/testmu-sdet1-akshay.git
```

Create a virtual environment.

```bash
python -m venv venv
```

Activate the environment.

Windows

```bash
venv\Scripts\activate
```

Install dependencies.

```bash
pip install -r requirements.txt
```

---

## Environment Variables

Create a `.env` file in the project root.

Example:

```
GEMINI_API_KEY=YOUR_API_KEY
```

---

## Run Tests

Execute all tests with html report generation.

```bash
pip install pytest-html

```

---

## Future Improvements

- Parallel execution using pytest-xdist
- CI/CD integration with GitHub Actions
- Cross-browser execution
- AI-powered test generation from user stories
- API schema validation

---

## Author

Akshay Bawaskar