<!--
Creator: WDI Team
Last edited by: Brianna
Location: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Hash Maps

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*

- Associative arrays are used in a **huge** variety of languages. For example:  
   - objects in JavaScript  
   - hashes in Ruby  
   - HashMaps in Java
   - dictionaries in Python

- Key-value stores are a fairly common kind of no SQL database. Redis is a popular example.


### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Describe and draw the structure of a hash map with separate chaining.
- Explain properties of a good hash function.
- Perform runtime analysis on the hash map data structure.


### Hash Map Basics

Hash maps are based on arrays. Each key is mapped to a slot in the array with a "hash" function.

![](https://upload.wikimedia.org/wikipedia/commons/7/7d/Hash_table_3_1_1_0_1_0_0_SP.svg)


### Choosing a Hash Function

Here's a hash function:

```ruby
def hash(key)
  0
end
```

It's not very good.


### Collisions

We can handle collisions in a few ways.  We could find a different slot in the array to put the key-value pair in.  

Our approach will be to add more key-value pairs to the same slot in the array.

![](https://upload.wikimedia.org/wikipedia/commons/d/d0/Hash_table_5_0_1_1_1_1_1_LL.svg)


### Challenges


In the `javascript/starter-code` directory, you'll find a basic hash map implementation that's based on a JavaScript singly linked list.

Working in that code:

- update the `put` method so that it will not store duplicate keys
- implement a `set` method to change the value associated with a key
