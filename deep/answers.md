# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Will the observations likely be evenly distributed across all boats, even if AquaByte most commonly collects observations between midnight and 1am? Why or why not?

ans: They will be evenly distributed.
The observations will be evenly distributed because each one is randomly assigned to any one of the three boats. Or, put another way, an observation is equally likely to be sent to any boat. So, even if AquaByte most commonly collects observations between midnight and 1am, observations will be evenly spread out among the boats.

Suppose a researcher wants to query for all observations between midnight and 1am. On how many of the boats will they need to run the query?

ans: The researcher will need to run the query on all of the boats.
Because the observations are randomly assigned to any boat, each observation between midnight and 1am could be on any one of the three boats. If a query is only run on one boat, there’s a chance it has missed observations, stored on other boats, that it should have returned.

The reason to use random partitioning would be if your given problem will likely overuse one of the boats, while other boats will be of little to no use. The will be unused storage on one boat and overload on another. The even distribution will help alliviate this problem.

The reason not to use this approach would be if you want the data to be sorted for easy querying. Random ordering will make searching for the data you want difficult because you'd have to search through all the boats to find what you need.

## Partitioning by Hour

opposite answers to random partitioning.

## Partitioning by Hash Value

Same answers as random partitioning.
Also, you would only have to search some boats if you want to search for a single timestamp.

This has the benefits of random distribution across boats and quickly being able to search. Also increased security.


