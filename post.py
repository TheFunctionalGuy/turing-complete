#! /bin/python3
import argparse
import fileinput


def post_process(files, comments):
    lines = fileinput.input(files=files if len(files) > 0 else ('-', ))
    post_processed_lines = []

    for line in lines:
        # Remove header
        if fileinput.isstdin() and fileinput.isfirstline():
            [next(lines) for _ in range(1)]
            continue

        # Strip line and skip if empty
        line = line.strip()
        if not line:
            continue

        # Get tokens
        left, asm = line.split(' ; ')
        outp, addr, opcode = left.split(' | ')

        # Skip labels
        if opcode.strip():
            if comments:
                post_processed_lines.append(' '.join(f'0x{hex}' for hex in opcode.strip().split(' ')) + ' # ' + asm)
            else:
                post_processed_lines.append(' '.join(f'0x{hex}' for hex in opcode.strip().split(' ')))

    return post_processed_lines


def write_output(lines, output_file):
    if output_file:
        print(f'Writing to: {args.output}')

        with open(args.output, 'w', encoding='utf-8') as output_file:
            # Write to output file without a trailing newline
            output_file.writelines('\n'.join(lines))
    else:
        # Write to stdout with trailing newline
        for line in lines:
            print(line)


def parse_arguments():
    parser = argparse.ArgumentParser(description='Post-process assembly output from customasm tool.')
    parser.add_argument('-o', '--output', help='Output file')
    parser.add_argument('-c', '--comments', action='store_true', help='Preserve assembly instructions as comments')
    parser.add_argument('files', metavar='FILE', nargs='*', help='Files to read, if empty stdin will be used instead')

    return parser.parse_args()


if __name__ == '__main__':
    args = parse_arguments()
    lines = post_process(args.files, args.comments)
    write_output(lines, args.output)
