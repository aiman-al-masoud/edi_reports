# Objective

Determine the average daily peak time of a server, using an active monitoring technique (traceroute).

# Hypothesis

When a server is experiencing too many requests, the following things are expected to happen:

## 1) Latency Surges

Because the server has to deal with a higher amount of packets per unit time, queueing is expected to happen, and the round trip time of packets sent to the server is expected to increase.

## 2) Number of hops increases

At peak time, congestion may take place on the normally optimal routes, and thus alternative routes, which may include more hops, will be sought by the packets, increasing the average number of hops to reach the server.

## 3) Number of dropped packages increases

Using UDP, there is no guarantee that the packets will reach the server, and if the network is congested and the server is busy, the drop rate is expected to increase.

# Setup

A script that performs traceroute on a target IP at regular intervals (every 5 minutes) was executed on a vantage point for a whole week. Then the collected data was processed offline. The vantage point in question was a virtual machine on GCP (Google Cloud Platform).




