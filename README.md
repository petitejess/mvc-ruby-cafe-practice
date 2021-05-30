# MVC Ruby Cafe App

A Model-View-Controller app based on previous Ruby Cafe App as a practice. The app created following MVC design.

The app simulates a very simple order process of items listed in the menu. User is expected to enter their order and the app will calculate and display the order with the total cost.

## Run Test

To run the tests, first add the required dependency:  

```
$ bundle add
```

Then, in the root directory of this project, run:
```
$ rspec
```

## Run App

To run the app, in the terminal, in the root directory of this project, run:
```
$ ruby ruby_cafe.rb
```

## Usage

The app will do the following:

1. Display welcome message.
1. Display the available menu.
1. Prompt input for the **name** of item you wish to order.
1. Prompt input for the **quantity** of item you wish to order.
1. Repeat prompting for input of name and quantity until you enter **'done'**.
1. Once done, it will display your order.