from google.cloud import bigquery
from google.oauth2 import service_account

credentials = service_account.Credentials.from_service_account_file("secrets.json")
client = bigquery.Client(credentials=credentials)
dataset = client.get_dataset('bigquery-public-data.hacker_news')


def print_tables(dataset_client):
    for table_item in list(client.list_tables(dataset_client)):
        print(table_item.table_id)


table_ref = dataset.table("full")
table = client.get_table(table_ref)
# print(table.schema)
df = client.list_rows(table, max_results=5).to_dataframe()
print(df)