# README

The Cat Factory is a simple app concept, intended to be re-written in different frameworks and languages. This allows for a clear and concise goal around which to structure learning new tools and refining skills and tehniques.

It also involves cats.

# TODO
The goal of this implementation is to generate cat pictures using [StyleGAN2](https://github.com/NVlabs/stylegan2). For the MVP, we may use pictures from http://thiscatdoesnotexist.com (which uses StyleGAN), if the terms allow, or use something like [TheCatAPI](https://thecatapi.com/).

## MVP
* When a user loads the page, it will load a random cat picture
* The user can upvote or downvote a cat picture. Doing so loads the next picture
* The user can not vote multiple times on the same cat

## Machine Learning
Rather than generating on-the-fly (which is expensive, and this is a silly hobby project), it will operate as follows:
* This app will run a nightly job to upload vote data to an S3 bucket
* StyleGAN2 will use vote data as a training source for the ML model
* StyleGAN2 will run a nightly SageMaker job to generate cat imgaes for 45 minutes (to a maximum of 10,000)
* The images will be placed in an S3 bucket which this app has access to. Old images will be deleted (see below for exception)

## Accounts
* The user can opt to "Adopt" the cat picture
  * This counts as 5 upvotes
  * The image will not be deleted
  * The cat can only be adopted by one user
  * The user can only adopt one cat
  * Adopting a new cat replaces the current adoptee, and removes 4 upvotes from it

## Competition
Eventually, there may be some competitive aspect (e.g. "teams" who compete for the cutest cats). Since cat generation is random, this should drive engagement and drive higher-quality vote data, as users are incentivised to keep searching/voting to find the cutest cats.

## Spoilers
It might be possible to mess up the system by a large amount of votes on poorly-generated pictures. That may be funny, and this is a ridiculous hobby project anyway, so it might not be worth addressing.
