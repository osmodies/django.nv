import json
import sys
from termcolor import colored

def parse_bandit_output(output):
    try:
        parsed_output = json.loads(output)
        return parsed_output['results']
    except json.JSONDecodeError as e:
        print(f"Error parsing Bandit output: {e}")
        return []

def print_colored(message, severity):
    if severity == 'HIGH':
        print(colored(message, 'red'))
    elif severity == 'MEDIUM':
        print(colored(message, 'blue'))
    elif severity == 'LOW':
        print(colored(message, 'yellow'))
    else:
        print(message)

def main():
    bandit_output = sys.stdin.read()
    parsed_results = parse_bandit_output(bandit_output)

    if parsed_results:
        print("Bandit findings:")
        for result in parsed_results:
            severity = result['issue_severity']
            confidence = result['issue_confidence']
            filename = result['filename']
            line_number = result['line_number']
            code = result['code']

            message = f"Severity: {severity}, Confidence: {confidence}\n" \
                      f"File: {filename}, Line: {line_number}\n" \
                      f"Code: {code}\n" \
                      + "-" * 50

            print_colored(message, severity)
    else:
        print("No Bandit issues found.")

if __name__ == "__main__":
    main()
