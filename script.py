import csv

#PATH = "/home/theone/Programillas/disenio/pre/digit/BereniceNoriega_DS_Adapt1L_2022-10-27_08h46.10.207.csv"
#PATH = "/home/theone/Programillas/disenio/pre/stroop/BereniceNoriega_StroopTask_2022-10-27_09h03.20.038.csv"
PATH = "/home/theone/Programillas/disenio/pre/gonogo/AndreaRosales_Trial go no go_2022-10-27_14h10.55.062.csv"

def main():
    with open(PATH, newline="", encoding="UTF-8") as f:
        reader = csv.DictReader(f)

        for name in NOMBRES:
            ...


def digit_span(reader, f):
    adi = [a["Forward WM score"] for a in reader]
    adelante = next(cell for cell in adi[::-1] if cell != "")

    f.seek(0)

    rev = [a["Backward WM score"] for a in reader]
    reversa = next(cell for cell in rev[::-1] if cell != "")

    return adelante, reversa


def go_nogo(reader, f):
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


def stroop(reader, f):
    obser = []
    tiempo = []

    for a in reader:
        if a["response.corr"]:
            obser.append(int(a["response.corr"]))
        if a["response.rt"]:
            tiempo.append(float(a["response.rt"]))

    punt = sum(obser) / len(obser)
    resp = round(sum(tiempo) / len(tiempo), 3)

    return punt, resp


if __name__ == "__main__":
    main()
