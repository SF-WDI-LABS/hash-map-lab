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
   - dictionaries in Python  
   - HashMaps in Java ...

- Key-value stores are a common kind of noSQL database. Redis is a popular example.


### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Describe and draw the structure of a hash map (with separate chaining).
- Explain properties of a good hash function.
- Perform runtime analysis on the hash map data structure.


### Hash Map Operations

Hash maps let us add key-value pairs, look up the value for a key, and delete a key-value pair. 


### Structure

Hash maps are based on arrays. Each key is mapped to a slot in the array with a "hash" function.

![](https://upload.wikimedia.org/wikipedia/commons/7/7d/Hash_table_3_1_1_0_1_0_0_SP.svg)

Note that these hash functions can be reversible, unlike the "cryptographic hash functions" used to encrypt things.


### Choosing a Hash Function

Let's say we've decided to use an array size of 16.


Here's a hash function:

```js
function hash(key){
  return Math.floor(Math.random()*16);
}
```

It won't work for us.  **Why?**

<details>
  <summary>click for explanation</summary>
  We need to be able to look up values by their keys, so the function has to send us to the same bucket every time we give it a particular key.
</details>


### Collisions


What if we want to be able to handle more inputs than we have slots in the array?  We're going to have to figure out how to deal with collisions!

We can handle collisions in a few ways.  We _could_ find a different slot in the array to put each value pair in. We might still end up with two values mapped to the same slot, in which case we'd have to resize the array or start removing elements.  

Our approach will be to add more key-value pairs to the same slot in the array.  This approach has its own limitations.

![](https://upload.wikimedia.org/wikipedia/commons/d/d0/Hash_table_5_0_1_1_1_1_1_LL.svg)



Here's another hash function:

```ruby
def hash(key)
  0
end
```

It's not very good.  **Why?**

<details>
  <summary>click for explanation</summary>
  This hash function sends all keys to the first bucket. We basically end up with a linked list!
</details>


### Check for understanding

Let's try to store information about many developers in a hash map with each  developer's name as the key for their information.

What happens if we choose an array length of 26 and a hash function that maps each name to the bucket that corresponds to the first letter?

```js
function hash(name){
  return (name.charCodeAt(0) - 65) % 26;
}
```

**Is this a good hash function?  How could we improve it?**


### Speed

<details><summary>spoiler</summary>
You might think of improving this hash function by using more than the first letter of the string so that we have fewer collisions.

```js
function hash(key, arrayLength) {
  arrayLength = arrayLength || 13;
  return key
    .split('').map(function (letter){
      return letter.charCodeAt();
    })
    .reduce(function(prev, curr) {
      return prev + curr;
    }) % arrayLength;
},
```
</details>

Hash maps promise `O(1)` lookup, insert, and delete.  In order to get fast performance from the data structure, we need fast (`O(1)`) performance from the hash function.

1. What is the Big O time complexity of the function above (in the spoiler) in terms of the length of the `key` string?

1. How can we change the hash function so that it still takes `O(1)` time *and* still distributes keys into buckets more evenly than our previous hash function that just used the first letter?

<details><summary>click for an idea</summary>
Looking at some [data](http://home.uchicago.edu/~jsfalk/misc/baby_names/), we can see there are pretty skewed percentages for just the first or last letter of a name, so using multiple letters seems like a decent idea. But using a variable number of letters based on the length of the string takes our time above `O(1)`.  A potential middle ground is choosing to use the first 3 letters.
</details>




### Coding Challenge


In the `javascript/starter-code` directory, you'll find a basic hash map implementation that's based on a JavaScript singly linked list.

Working in that code:

- update the `put` method so that it will not store duplicate keys
- implement a `set` method to change the value associated with a key
