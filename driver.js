var HashMap = require('./hash-map.js');


/* Initialize a hashMap of array length 13. 13 is prime. 13 is magic. */
var hMap = new HashMap(13);

// var paragraph = "Hi everyone this is justin how are you i am fine thank you for asking that is so very sweet of you so i am an instructor at general assembly in san francsico california which is actually a republic i don't know if you knew that but it is true"
//
// /* Rip the above paragraph into an array and feed each word into the hashMap. */
// paragraph.split(' ').forEach(function add(word) { hMap.put(word, word.split('').reverse().join('')); });

hMap.put('fruit', 'apple');

/* Demonstrate the get() method */
var found = hMap.get('fruit');
console.log('Found:', found);

/* Demonstrate the remove() method */
var deleted = hMap.remove('fruit');
console.log('Deleted;',  deleted);

/* Print the hashMap in it's connected entirity */
//hMap.print();

/* Print a list */
//keys = hMap.keySet();
//console.log(keys);
