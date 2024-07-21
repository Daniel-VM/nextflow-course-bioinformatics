import argparse

def main():
    # Create the parser
    parser = argparse.ArgumentParser(description="Print a funny message using a provided name.")
    
    # Add the "name" argument
    parser.add_argument('name', type=str, help="The name to be used in the funny message.")
    
    # Parse the command-line arguments
    args = parser.parse_args()
    
    # Generate and print the funny message
    funny_message = f"Hey {args.name}, why did the bioinformatician use Nextflow for their workflow? Because they wanted to make sure their results were 'pipelin' hot and reproducible!"
    print(funny_message)

if __name__ == "__main__":
    main()
