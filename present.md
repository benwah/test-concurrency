# Concurrency VS Paralellism

## Concurrency

Things happening at the same time

Example:

While waiting in line at Starbucks, I'm sending approving a pull request.

## Parallelism

Things happening at the same time, in parallel

Example:

While waiting in line at Starbucks, Alex Topalov is approving a pull request.

## Threads & Processes

... A process has at least 1 thread
... A process can have more than 1 thread
... A thread has access to its process's memory
... The operating system can run threads on multiple cores in parallel
... A single-core computer cannot run things in parallel


## Concurrently!

Plan:

* Spawn VM with 1 core
* Test Expensive job, Single, Multi Thread, Multi Process, note results
* Test IO Bound job, Single, Multi Thread, Multi Process, note results

## Parallel!

* Spawn VM with 4 core
* Test Expensive job, Single, Multi Thread, Multi Process, note results
* Test IO Bound job, Single, Multi Thread, Multi Process, note results

## Discuss...

* How does this affect us?
* Puma VS Unicorn
* Sidekiq VS Resque

## If there's time, profile this stuff



https://github.com/ruby-prof/ruby-prof/blob/master/examples/graph.txt

https://stackoverflow.com/questions/1050222/what-is-the-difference-between-concurrency-and-parallelism
