import argparse

def main():
    # Create the parser
    parser = argparse.ArgumentParser(description="Calculate the sum of two integers.")

    # Add the arguments
    parser.add_argument('num1', type=int, help="The first integer")
    parser.add_argument('num2', type=int, help="The second integer")

    # Parse the arguments
    args = parser.parse_args()

    # Calculate the sum
    result = args.num1 + args.num2

    # Print the result
    print(f"The sum of {args.num1} and {args.num2} is {result}")
    return result

if __name__ == "__main__":
    main()
