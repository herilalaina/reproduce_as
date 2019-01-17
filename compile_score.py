import pandas as pd
import sys
sys.path.insert(0,'../../')
import openml_100



DATA = pd.DataFrame(columns=['Time', 'Performance_test', 'Performance_time', 'Task', "Seed", "Configurator"])

w = 0
for task in openml_100.list_data:
    for seed in range(1, 11):
        path_direcotry = "test_output/{0}/{1}/score_vanilla.csv".format(seed, task)

        try:
            data = pd.read_csv(path_direcotry)

            for index, row in data.iterrows():
                DATA.loc[w] = [row[0], row[2], row[1], task, seed, "Auto-Sklearn"]
                w += 1

        except Exception as e:
            print("Error: ", task, seed, e)
            # raise e


DATA.to_csv("SCORE_AUTO_SKLEARN_vanilla.csv", index=None)
