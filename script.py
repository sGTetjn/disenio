import os
import csv

TITULOS = ["Digit.forw", "Digit.back", "Stroop.corr", "Stroop.rt", "Go.forw", "Go.back", "Nogo.forw", "Nogo.back", "Gonogo.rt", "Digit.forw", "Digit.back", "Stroop.corr", "Stroop.rt", "Go.forw", "Go.back", "Nogo.forw", "Nogo.back", "Gonogo.rt"]


def main():
    with open("resultados.csv", "a", encoding="UTF-8", newline="") as g:
        writer = csv.writer(g, delimiter="\t", quoting=csv.QUOTE_MINIMAL)
        writer.writerow([TITULOS])
    for group in os.scandir("a"):
        for name in os.scandir(group):
            subject = []
            for test in sorted(os.scandir(name), key=lambda x: x.name):
                with open(test, encoding="UTF-8") as f:
                    reader = csv.DictReader(f)
                    if "DS" in test.name:
                        subject.append(digit_span(reader, f))
                    elif "go no go" in test.name:
                        subject.append(go_nogo(reader))
                    else:
                        subject.append(stroop(reader))
            with open("resultados.csv", "a", encoding="UTF-8") as g:
                writer = csv.writer(g, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
                writer.writerow([item for sublist in subject for item in sublist])

def digit_span(reader, f):
    adi = [a["Forward WM score"] for a in reader]
    adelante = next(cell for cell in adi[::-1] if cell != "")

    f.seek(0)

    rev = [a["Backward WM score"] for a in reader]
    reversa = next(cell for cell in rev[::-1] if cell != "")

    return round(float(adelante), 3), round(float(reversa), 3)


def go_nogo(reader):
    go_ad = []
    go_re = []
    no_ad = []
    no_re = []
    tiempo = []

    for a in reader:
        if a["stimulus_test1"]:
            if a["corrAns_test1"] == "space":
                go_ad.append(int(a["resp_trial_Test1.corr"]))
            else:
                no_ad.append(int(a["resp_trial_Test1.corr"]))
            if a["resp_trial_Test1.rt"]:
                tiempo.append(float(a["resp_trial_Test1.rt"]))
        elif a["stimulus_test2"]:
            if a["corrAns_test2"] == "space":
                go_re.append(int(a["key_resp.corr"]))
            else:
                no_re.append(int(a["key_resp.corr"]))
            if a["key_resp.rt"]:
                tiempo.append(float(a["key_resp.rt"]))

    go_ad = sum(go_ad) / len(go_ad)
    go_re = sum(go_re) / len(go_re)
    no_ad = sum(no_ad) / len(no_ad)
    no_re = sum(no_re) / len(no_re)
    tiempo = round(sum(tiempo) / len(tiempo), 3)

    return go_ad, go_re, no_ad, no_re, tiempo


def stroop(reader):
    obser = []
    tiempo = []

    for a in reader:
        if a["response.corr"]:
            obser.append(int(a["response.corr"]))
        if a["response.rt"]:
            tiempo.append(float(a["response.rt"]))

    punt = sum(obser) / len(obser)
    resp = round(sum(tiempo) / len(tiempo), 3)

    return round(punt, 3), round(resp, 3)


if __name__ == "__main__":
    main()
