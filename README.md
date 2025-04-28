
<p align="center"><h1 align="center">S2.01. Data Structure - MySQL </h1></p>

<br>

---

## 📍 Objectives

Learn to model SQL databases.
---

## 👾 Exercises
### 📌 Level 1 - ex 1 
An optician, called “Cul d'Ampolla”, wants to computerize the management of customers and sales of glasses.
First of all, the optician wants to know who the supplier of each pair of glasses is. Specifically, it wants to know about each supplier:
The name / The address (street, number, floor, door, city, postal code and country) / Telephone / Fax / NIF.

The optician's purchasing policy is based on the fact that glasses of a brand will be purchased from a single supplier (so it can get better prices), but it can buy glasses of several brands from one supplier. About the glasses, it wants to know:
The brand / The prescription of each lens / The type of frame (floating, plastic or metal) / The color of the frame / The color of each lens / The price 

About the customers, it wants to store: The name / The postal address / The phone number / The email address / The registration date / 
When a new customer arrives, store the customer who recommended the establishment (provided someone recommended it).

Our system will need to indicate which employee sold each pair of glasses.

### 📌 Level 1 - ex 2
You have been hired to design a website that allows you to order food online.

Consider the following guidelines to model what the project database would look like:
For each customer, we store a unique identifier: First name / Last name / Address / Postal code / City / Province / Telephone number / 
The city and province data will be stored in separate tables. We know that a city belongs to a single province, and that a province can have many cities. 
For each city, we store a unique identifier and a name. For each province, we store a unique identifier and a name.

A person can place many orders, but a single order can only be placed by a single person. 
A unique identifier is stored for each order:
Date/time / Whether the order is for home delivery or for pick-up in a store / The quantity of products that have been selected of each type / The total price.
An order can consist of one or more products.

Products can be pizzas, hamburgers and drinks. A unique identifier is stored for each product: Name / Description / Image / Price / 
In the case of pizzas, there are several categories that can change their names throughout the year. A pizza can only be in one category, but a category can have many pizzas.

A unique identifier and a name are stored for each category. An order is managed by a single store and a store can manage many orders. A unique identifier is stored for each store:
Address / Postal code / City / Province.

Many employees can work in a store and an employee can only work in one store. A unique identifier is stored for each employee:
First name / Last name / NIF / Telephone.
If you work as a cook or delivery person. For home delivery orders, it is important to save who the delivery person is who delivers the order and the date/time of delivery.


### 📌 Level 2 - ex 1
We will try to make a simple model of what the database for a reduced version of YouTube would be like.
For each user, we store a unique identifier:
Email / Password / Username / Date of birth / Sex / Country / Postal code.
A user publishes videos. For each video, we store a unique identifier:
A title / A description / A size / The name of the video file / Duration of the video / A thumbnail The number of views / The number of likes The number of dislikes.
A video can have three different states: public, hidden and private. A video can have many tags. A tag is identified by a unique identifier and a tag name. It is important to store who the user is who publishes the video and at what date/time they do it.
A user can create a channel. A channel has a unique identifier: A name / A description / A creation date.
A user can subscribe to other users' channels. A user can like or dislike a video only once. You will need to keep a record of the users who have liked and disliked a particular video and the date/time they did so.
A user can create playlists with the videos they like. Each playlist has a unique identifier: A name / A creation date / A status that indicates whether it can be public or private.
A user can write comments on a particular video. Each comment is identified by a unique identifier: The text of the comment / The date/time it was made.
A user can mark a comment as liked or disliked. It will be necessary to keep a record of the users who have marked a comment as "like"/"dislike" and the date/time they did so.

### 📌 Level 3 - ex 1
We will try to make a simple model of what the database needed for Spotify would be like.

There are two types of users: free and premium. For each user, we store a unique identifier:
Email.
Password.
Username.
Date of birth.
Gender.
Country.
Postal code.

Premium users make subscriptions. The necessary data that will need to be saved for each subscription are:
Subscription start date.
Service renewal date.
A payment method, which can be by credit card or PayPal.

For credit cards, we store the card number, month and year of expiration, and the security code. For users who pay with PayPal, we store the PayPal username. 
We are interested in keeping a record of all the payments that a premium user has made during the period they are subscribed to. For each payment, the following is stored:
The date.
A sequence number (which is unique).
A total.

A user can create many playlists. For each playlist we store:
A title.
The number of songs it contains.
A unique identifier.
A creation date.

When a user deletes a playlist, it is not deleted from the system, but is marked as deleted. In this way, the user can recover their playlists in case they have deleted them by mistake. 
It is necessary to store the date on which the playlist was marked as deleted.

We can say that there are two types of playlists: active and deleted. A playlist that is active can be shared with other users, which means that other users can add songs to it. 
In a shared list, we are interested in knowing which user added each song and on what date.
A song can only belong to a single album. An album can contain many songs. An album has been released by a single artist. An artist can have released many albums. For each song we store a unique identifier:
A title.
A duration.
The number of times it has been played by Spotify users.

For each album we store a unique identifier:
Title.
Year of release.
A cover image.
.
For each artist we store a unique identifier:
Name.
A picture of the artist

A user can follow many artists. An artist can be related to other artists who make similar music. So that Spotify can show us a list of artists related to the artists we like. 
We are also interested in storing what a user's favorite albums and songs are. A user can select many albums and many songs as favorites.

---
## 🚀 Getting Started

### ☑️ Prerequisites

- MySQL Workbench 8.0
- IntelliJ oir Eclipse IDE


### ⚙️ Installation

Clone the S2.01 repository:
```sh
❯ git clone https://github.com/zohra-b/S2.01
```
