import os

from dotenv import load_dotenv
from google import genai

load_dotenv()

API_KEY = os.getenv("GEMINI_API_KEY")

client = genai.Client(api_key=API_KEY)


def explain_failure(test_name, error_message, current_url, page_title):

    prompt = f"""
You are an experienced QA Automation Engineer.

Analyze the following Selenium test failure.

Test Name:
{test_name}

Error:
{error_message}

Current URL:
{current_url}

Page Title:
{page_title}

Please provide:

1. Root Cause
2. Explanation
3. Suggested Fix

Keep the response concise.
"""

    response = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=prompt
    )

    return response.text