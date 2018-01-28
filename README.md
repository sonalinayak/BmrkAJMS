# Serverless Performance

This package allows you to measure performance characteristics of serverless platforms AWS Lambda and Google Cloud Functions.

The <a href='http://www.serverless.com'>Serverless Framework</a> is used as the deployment engine for this package.

## Getting Started

### Install Package

Serverless package can be installed via npm:

```bash
npm install serverless-performance
```

### Configure and run Platforms

You must configure credentials before using any of the supported platforms:

* **AWS Lambda** can be configured by following this <a href='https://serverless.com/framework/docs/providers/aws/guide/credentials/'>guide</a> on the Serverless Framework website and obtain keys.
Set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in awslambda/start_bench_tofile.sh file with the key values.

* **Google Cloud Functions** can be configured by creating a `keyfile.json` file as described <a href='https://github.com/serverless/serverless-google-cloudfunctions'>here</a>. Update project and creadentials with project ID and abosolute path of `keyfile.json` respectively in `gfunction/serverless.yml` file

* Run bash files in both the providers to get the benchmarks of deployment, cold start and warm start latencies.

## For AWS lambda
 ```bash
 cd awslambda 
 start start_bench_tofile.sh 
 ```
 
## For Google Cloud Functions
 ```bash
 cd gfunction
 start start_bench_tofile.sh
 ```


The results obtained in the textfile helps us understand the latencies of execution, both cold and warm, also deployment time on AWS Lambda and Google Cloud Functions.
