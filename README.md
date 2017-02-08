<!--
Creator: WDI Team (Justin)
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

Hash maps let us add key-value pairs, look up the value for a key, and delete a key-value pair.  What's more, they let us do any of these operations in `O(1)` (constant) time!


### Structure

Hash maps are based on arrays. Each key is mapped to a slot in the array with a "hash" function.

![](https://upload.wikimedia.org/wikipedia/commons/7/7d/Hash_table_3_1_1_0_1_0_0_SP.svg)


The key is tied to the value for two purposes:

**When storing a key-value pair**, we look up the hash of the key to check which index of the array it belongs in.  So if `hash('my key')` is `7`, we know to put that key in index 7.  

**When looking up a value by key**, we use the hash to find the index corresponding to that key.   When we do `hash('my key')` and get `7`, we know all the information about that key should be in slot 7.

Note that these hash functions can be reversible, unlike the "cryptographic hash functions" used to encrypt things.


### Choosing a Hash Function

Let's say we've decided to use an array size of 16.


Here's a hash function:

```js
function hash(key){
  return Math.floor(Math.random()*16);
}
```

It won't work for us.  **Why?**  Hint: think about inserting a key and looking it up later.

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

It's not very good.  **Why?** Hint: draw out the resulting structure after a few insertions.

<details>
  <summary>click for explanation</summary>
  This hash function sends all keys to the first bucket. We basically end up with a linked list!
</details>


### Check for Understanding

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
};
```
</details>

Hash maps promise `O(1)` lookup, insert, and delete.  In order to get fast performance from the data structure, we need fast (`O(1)`) performance from the hash function.

1. What is the Big O time complexity of the function above (in the spoiler)? How does it depend on the length of the `key` string(s)?

<details><summary>click for an idea</summary>
The `split`, `map`, and `reduce` functions are taking an action on each letter of the key.  If we say `n` is the length of the longest key string, then that means this hash function is at least `O(n)`.  That's not compatible with the `O(1)` insertion, lookup, and delete that a hash map promises.
</details>

1. How can we change the hash function so that it still takes `O(1)` time *and* still distributes keys into buckets more evenly than our previous hash function (the one that just used the first letter)?

<details><summary>click for an idea</summary>
Looking at some [data](http://home.uchicago.edu/~jsfalk/misc/baby_names/), we can see there are pretty skewed percentages for just the first or last letter of a name, so using multiple letters seems like a decent idea. But using a variable number of letters based on the length of the string takes our time above `O(1)`.  A potential middle ground is choosing to use the first 2 or 3 letters.  

On the other hand, we could just say that all our keys will be below a certain number of characters - maybe 32 character is a reasonable limit for a first name. Then our `O(n)` from above is actually capped at `O(32)`, which is the same as `O(1)`. Setting a limit on the variable length turns it into a constant for this big O analysis.

Because of how computers store data in binary format, we can also reduce the time it takes to run `%` by choosing an array length that's a power of 2. This doesn't affect the big O analysis, and in fact its practical effect is quite small.
</details>

Of course, if we knew ahead of time exactly which developers we'd need to hash, we could make a perfect hashing function that's `O(1)`, distributes names evenly, and always gives the same results for the same input:

```rb
def hash(key)
  if key == "Michelle" || key == "Nathan"
    0
  elsif key == "Jean" || key == "Justin"
    1
  elsif key == "Brianna" || key == "Cory"
    2
  elsif key == "Alex" || key == "Ben" 
    3
  elsif key == "Del" || key == "Ilias"
  #....
```


### Coding Challenge


In the `javascript/starter-code` directory, you'll find a basic hash map implementation that's based on a JavaScript singly linked list.  Note that this singly linked list implementation stores a `key` and some  `data` in each node.

Working in that code:

- update the `put` method so that it will not store duplicate keys
- implement a `set` method to change the value associated with a key

### Closing Thoughts

1. What is a hash map?

1. What are the Big O time complexities of inserting something into a hash map, deleting something from it, and searching for something (looking something up) by key?
