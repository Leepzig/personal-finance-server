# README

# Personal Finance App

## Description

This application was created to help myself and others keep track of their personal finances, to allow people to make budget predictions and then record the actual occurences to compare the two. So that you can adjust your budget or behavior to meet your expectations for the next time.

The user is able to input various expected income and expense rows in a table and then see totals in each column.  At the end of the month the user can see a comparison to how his actual spendings met or did not meet his expectations.

## Technologies

This project has a react front-end using redux to manage global state. It uses Material UI for styling.

The backend is managed by Ruby On Rails.

## Challenges

The greatest challenge when making this project was allowing the server to update the front end in real time. There is a small delay due to state being updated, but a user is able to update a text box and those changes be reflected in the back end using an onBlur effect.