from datasets import list_datasets, load_dataset

# build a dataset search query
def search(query, limit=10, sort=True):
    """Search for a dataset by name or description"""

    # get all datasets that match the query
    datasets = [dataset for dataset in list_datasets() if query in dataset]
    sorted_datasets = sorted(datasets) if sort else datasets
    limited_result = sorted_datasets if limit is None else sorted_datasets[:limit]
    return limited_result


def inspect_data(dataset, column="train", rows=5):
    """Inspect a dataset"""

    # load dataset
    dataset = load_dataset(dataset)
    # get first 5 rows of first split
    data = dataset[column][0:rows]
    return data


# Load a dataset and print the first example in the training set
#dataset = load_dataset("yelp_review_full")

# write a pandas dataframe to gzipped CSV file
#for split, data in dataset.items():
#    data.to_csv(f"my-dataset-{split}.csv", index = None, compression="gzip")
