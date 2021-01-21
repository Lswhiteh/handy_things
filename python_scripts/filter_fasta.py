import argparse


def filter_fasta(fastafile, out_fasta, filter_list):
    with open(fastafile, "r") as infasta:
        lines = [i.strip() for i in infasta.readlines()]

    headers = [i for i in range(len(lines)) if ">" in lines[i]]

    selected_entries = []
    with open(out_fasta, "w") as outfasta:
        for i in range(len(headers)):
            if any(j in lines[headers[i]] for j in filter_list):
                if i == len(headers):
                    outfasta.write(lines[headers[i]] + "\n")
                    outfasta.write("".join(lines[headers[i] + 1 :]) + "\n")
                else:
                    outfasta.write(lines[headers[i]] + "\n")
                    outfasta.write(
                        "".join(lines[headers[i] + 1 : headers[i + 1]]) + "\n"
                    )


def parse_args():
    ap = argparse.ArgumentParser(
        description="Quick script to filter Fasta files based on presence of a list of strings in headers."
    )
    ap.add_argument(
        "-i",
        "--input-fasta",
        help="Fasta file to select entries from.",
        type=str,
        required=True,
        dest="infile",
    )
    ap.add_argument(
        "-o",
        "--output-fasta",
        help="Name of Fasta file to output filtered entries to.",
        type=str,
        default="filtered.fasta",
        dest="outfile",
    )
    ap.add_argument(
        "-f",
        "--filters",
        help="Strings to filter Fasta entries with. Must be present in the header of the entry and uniquely identifiable.",
        nargs="+",
        required=True,
        dest="filtlist",
    )
    parsed = ap.parse_args()

    return parsed


def main():
    ap = parse_args()
    filter_fasta(ap.infile, ap.outfile, ap.filtlist)


if __name__ == "__main__":
    main()
