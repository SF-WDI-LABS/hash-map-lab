// var HashMap = require('./starter-code/hash-map.js');
var HashMap = require('./solution/hash-map.js');


/* Initialize a hashMap of array length 13. 13 is prime. 13 is magic. */
var hMap = new HashMap(13);

var paragraph = "In computer science an associative array, map, symbol table, or dictionary is an abstract data type composed of a collection of key value pairs, such that each possible key appears at most once in the collection."

// /* Rip the above paragraph into an array and feed each word into the hashMap. */
paragraph.split(' ').forEach(function add(word) { hMap.put(word, word.split('').reverse().join('')); });

hMap.put('fruit', 'apple');

/* Demonstrate the get() method */
var found = hMap.get('fruit');
console.log('Found:', found);

/* TODO: Implement the `set` method! */
hMap.set('fruit', 'banana');

/* Demonstrate the remove() method */
var deleted = hMap.remove('is');
console.log('Deleted;',  deleted);

/* Print the hashMap in it's connected entirity */
hMap.print();

/* Print a list of keys*/
keys = hMap.keySet();
console.log(keys);

// The list should contain "fruit" and should not contain "is"!
