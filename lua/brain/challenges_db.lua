-- Built-in challenge templates
local M = {}

M.challenges = {
  {
    name = "LRU Cache",
    difficulty = "medium",
    stub = [==[
/**
 * LRU Cache
 *
 * Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
 *
 * Implement the LRUCache class:
 * - LRUCache(capacity: number) — Initialize the cache with positive size capacity.
 * - get(key: number): number — Return the value of the key if it exists, otherwise return -1.
 * - put(key: number, value: number): void — Update or insert the value. When the cache reaches
 *   capacity, evict the least recently used key before inserting a new item.
 *
 * Both get and put must run in O(1) average time complexity.
 */

export class LRUCache {
  constructor(capacity: number) {
    // YOUR CODE HERE
  }

  get(key: number): number {
    // YOUR CODE HERE
    return -1;
  }

  put(key: number, value: number): void {
    // YOUR CODE HERE
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { LRUCache } from './challenge';

describe('LRU Cache', () => {
  it('basic get and put', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(1);
  });

  it('evicts least recently used', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    expect(cache.get(2)).toBe(-1);
  });

  it('get refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(1);
    expect(cache.get(2)).toBe(-1);
  });

  it('updates existing key', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(1, 10);
    expect(cache.get(1)).toBe(10);
  });

  it('returns -1 for missing keys', () => {
    const cache = new LRUCache(1);
    expect(cache.get(99)).toBe(-1);
  });

  it('capacity of 1', () => {
    const cache = new LRUCache(1);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
  });

  it('many operations', () => {
    const cache = new LRUCache(3);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    cache.put(4, 4);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
    expect(cache.get(3)).toBe(3);
    expect(cache.get(4)).toBe(4);
  });

  it('put refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(1, 10);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(10);
    expect(cache.get(2)).toBe(-1);
  });

  it('stress test', () => {
    const cache = new LRUCache(10);
    for (let i = 0; i < 100; i++) {
      cache.put(i, i * 2);
    }
    for (let i = 0; i < 90; i++) {
      expect(cache.get(i)).toBe(-1);
    }
    for (let i = 90; i < 100; i++) {
      expect(cache.get(i)).toBe(i * 2);
    }
  });
});
]==],
  },
  {
    name = "Flatten Nested Array",
    difficulty = "easy",
    stub = [==[
/**
 * Flatten Nested Array
 *
 * Given a nested array of integers and arrays, return a single flat array
 * containing all the integers in the same order.
 *
 * Do NOT use Array.prototype.flat() — implement it yourself.
 *
 * Example: flatten([1, [2, [3, 4], 5], 6]) => [1, 2, 3, 4, 5, 6]
 */

export type NestedArray = (number | NestedArray)[];

export function flatten(arr: NestedArray): number[] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { flatten } from './challenge';

describe('Flatten Nested Array', () => {
  it('already flat', () => {
    expect(flatten([1, 2, 3])).toEqual([1, 2, 3]);
  });

  it('one level nesting', () => {
    expect(flatten([1, [2, 3], 4])).toEqual([1, 2, 3, 4]);
  });

  it('deep nesting', () => {
    expect(flatten([1, [2, [3, [4, [5]]]]])).toEqual([1, 2, 3, 4, 5]);
  });

  it('empty array', () => {
    expect(flatten([])).toEqual([]);
  });

  it('nested empty arrays', () => {
    expect(flatten([[], [[]], [[], []]])).toEqual([]);
  });

  it('single element', () => {
    expect(flatten([42])).toEqual([42]);
  });

  it('mixed depths', () => {
    expect(flatten([1, [2, [3, 4], 5], 6])).toEqual([1, 2, 3, 4, 5, 6]);
  });

  it('negative numbers', () => {
    expect(flatten([-1, [-2, [-3]]])).toEqual([-1, -2, -3]);
  });

  it('large flat array', () => {
    const arr = Array.from({ length: 1000 }, (_, i) => i);
    expect(flatten(arr)).toEqual(arr);
  });

  it('deeply nested single element', () => {
    expect(flatten([[[[[[7]]]]]])).toEqual([7]);
  });
});
]==],
  },
  {
    name = "Binary Search",
    difficulty = "easy",
    stub = [==[
/**
 * Binary Search
 *
 * Implement binary search on a sorted array of numbers.
 * Return the index of the target, or -1 if not found.
 *
 * Constraint: Must be O(log n) time complexity.
 */

export function binarySearch(nums: number[], target: number): number {
  // YOUR CODE HERE
  return -1;
}

/**
 * Bonus: Find the first position where target could be inserted
 * to keep the array sorted (lower bound).
 */
export function lowerBound(nums: number[], target: number): number {
  // YOUR CODE HERE
  return 0;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { binarySearch, lowerBound } from './challenge';

describe('Binary Search', () => {
  it('finds element in middle', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 5)).toBe(2);
  });

  it('finds first element', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 1)).toBe(0);
  });

  it('finds last element', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 9)).toBe(4);
  });

  it('returns -1 for missing element', () => {
    expect(binarySearch([1, 3, 5, 7, 9], 4)).toBe(-1);
  });

  it('empty array', () => {
    expect(binarySearch([], 1)).toBe(-1);
  });

  it('single element found', () => {
    expect(binarySearch([42], 42)).toBe(0);
  });

  it('single element not found', () => {
    expect(binarySearch([42], 7)).toBe(-1);
  });

  it('large array', () => {
    const arr = Array.from({ length: 10000 }, (_, i) => i * 2);
    expect(binarySearch(arr, 5000)).toBe(2500);
    expect(binarySearch(arr, 5001)).toBe(-1);
  });
});

describe('Lower Bound', () => {
  it('target exists', () => {
    expect(lowerBound([1, 3, 5, 7, 9], 5)).toBe(2);
  });

  it('target missing - insert in middle', () => {
    expect(lowerBound([1, 3, 5, 7, 9], 4)).toBe(2);
  });

  it('insert at beginning', () => {
    expect(lowerBound([1, 3, 5], 0)).toBe(0);
  });

  it('insert at end', () => {
    expect(lowerBound([1, 3, 5], 10)).toBe(3);
  });
});
]==],
  },
  {
    name = "Debounce Function",
    difficulty = "medium",
    stub = [==[
/**
 * Debounce
 *
 * Implement a debounce function that delays invoking the provided function
 * until after `wait` milliseconds have elapsed since the last time it was invoked.
 *
 * The debounced function should also have a `cancel()` method to cancel pending invocations
 * and a `flush()` method to immediately invoke any pending invocation.
 */

type AnyFunction = (...args: any[]) => any;

interface DebouncedFunction<T extends AnyFunction> {
  (...args: Parameters<T>): void;
  cancel(): void;
  flush(): void;
}

export function debounce<T extends AnyFunction>(fn: T, wait: number): DebouncedFunction<T> {
  // YOUR CODE HERE
  const noop = (() => {}) as any;
  noop.cancel = () => {};
  noop.flush = () => {};
  return noop;
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { debounce } from './challenge';

describe('Debounce', () => {
  beforeEach(() => { vi.useFakeTimers(); });
  afterEach(() => { vi.restoreAllTimers(); });

  it('delays execution', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    expect(fn).not.toHaveBeenCalled();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledOnce();
  });

  it('resets timer on subsequent calls', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(50);
    debounced();
    vi.advanceTimersByTime(50);
    expect(fn).not.toHaveBeenCalled();
    vi.advanceTimersByTime(50);
    expect(fn).toHaveBeenCalledOnce();
  });

  it('passes arguments from last call', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced(1);
    debounced(2);
    debounced(3);
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledWith(3);
  });

  it('cancel prevents execution', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    debounced.cancel();
    vi.advanceTimersByTime(200);
    expect(fn).not.toHaveBeenCalled();
  });

  it('flush executes immediately', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced(42);
    debounced.flush();
    expect(fn).toHaveBeenCalledWith(42);
  });

  it('flush does nothing if no pending call', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced.flush();
    expect(fn).not.toHaveBeenCalled();
  });

  it('can be called again after flush', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced(1);
    debounced.flush();
    debounced(2);
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('multiple rapid calls only fire once', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 50);
    for (let i = 0; i < 100; i++) {
      debounced(i);
    }
    vi.advanceTimersByTime(50);
    expect(fn).toHaveBeenCalledOnce();
    expect(fn).toHaveBeenCalledWith(99);
  });
});
]==],
  },
  {
    name = "Event Emitter",
    difficulty = "medium",
    stub = [==[
/**
 * Event Emitter
 *
 * Implement a type-safe event emitter class with the following methods:
 * - on(event, listener) — Register a listener. Returns an unsubscribe function.
 * - emit(event, ...args) — Call all listeners for that event with the given args.
 * - once(event, listener) — Like on(), but the listener auto-removes after first call.
 * - off(event, listener) — Remove a specific listener.
 * - listenerCount(event) — Return the number of listeners for an event.
 */

export class EventEmitter {
  on(event: string, listener: (...args: any[]) => void): () => void {
    // YOUR CODE HERE
    return () => {};
  }

  emit(event: string, ...args: any[]): void {
    // YOUR CODE HERE
  }

  once(event: string, listener: (...args: any[]) => void): () => void {
    // YOUR CODE HERE
    return () => {};
  }

  off(event: string, listener: (...args: any[]) => void): void {
    // YOUR CODE HERE
  }

  listenerCount(event: string): number {
    // YOUR CODE HERE
    return 0;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { EventEmitter } from './challenge';

describe('EventEmitter', () => {
  it('on and emit', () => {
    const ee = new EventEmitter();
    const fn = vi.fn();
    ee.on('test', fn);
    ee.emit('test', 1, 2);
    expect(fn).toHaveBeenCalledWith(1, 2);
  });

  it('multiple listeners', () => {
    const ee = new EventEmitter();
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    ee.on('test', fn1);
    ee.on('test', fn2);
    ee.emit('test');
    expect(fn1).toHaveBeenCalledOnce();
    expect(fn2).toHaveBeenCalledOnce();
  });

  it('on returns unsubscribe function', () => {
    const ee = new EventEmitter();
    const fn = vi.fn();
    const unsub = ee.on('test', fn);
    unsub();
    ee.emit('test');
    expect(fn).not.toHaveBeenCalled();
  });

  it('off removes listener', () => {
    const ee = new EventEmitter();
    const fn = vi.fn();
    ee.on('test', fn);
    ee.off('test', fn);
    ee.emit('test');
    expect(fn).not.toHaveBeenCalled();
  });

  it('once fires only once', () => {
    const ee = new EventEmitter();
    const fn = vi.fn();
    ee.once('test', fn);
    ee.emit('test');
    ee.emit('test');
    expect(fn).toHaveBeenCalledOnce();
  });

  it('listenerCount', () => {
    const ee = new EventEmitter();
    expect(ee.listenerCount('test')).toBe(0);
    ee.on('test', () => {});
    ee.on('test', () => {});
    expect(ee.listenerCount('test')).toBe(2);
  });

  it('different events are independent', () => {
    const ee = new EventEmitter();
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    ee.on('a', fn1);
    ee.on('b', fn2);
    ee.emit('a');
    expect(fn1).toHaveBeenCalled();
    expect(fn2).not.toHaveBeenCalled();
  });

  it('emit with no listeners does nothing', () => {
    const ee = new EventEmitter();
    expect(() => ee.emit('nope')).not.toThrow();
  });

  it('once unsubscribe before emit', () => {
    const ee = new EventEmitter();
    const fn = vi.fn();
    const unsub = ee.once('test', fn);
    unsub();
    ee.emit('test');
    expect(fn).not.toHaveBeenCalled();
  });

  it('stress: many listeners', () => {
    const ee = new EventEmitter();
    const fns = Array.from({ length: 50 }, () => vi.fn());
    fns.forEach(fn => ee.on('x', fn));
    ee.emit('x', 'data');
    fns.forEach(fn => expect(fn).toHaveBeenCalledWith('data'));
    expect(ee.listenerCount('x')).toBe(50);
  });
});
]==],
  },
  {
    name = "Deep Clone",
    difficulty = "medium",
    stub = [==[
/**
 * Deep Clone
 *
 * Implement a deep clone function that handles:
 * - Primitives (number, string, boolean, null, undefined)
 * - Plain objects
 * - Arrays
 * - Date objects
 * - RegExp objects
 * - Map and Set
 * - Circular references (should not infinite loop!)
 *
 * Do NOT use structuredClone or JSON.parse(JSON.stringify(...)).
 */

export function deepClone<T>(value: T): T {
  // YOUR CODE HERE
  return value;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { deepClone } from './challenge';

describe('Deep Clone', () => {
  it('primitives', () => {
    expect(deepClone(42)).toBe(42);
    expect(deepClone('hello')).toBe('hello');
    expect(deepClone(true)).toBe(true);
    expect(deepClone(null)).toBe(null);
    expect(deepClone(undefined)).toBe(undefined);
  });

  it('plain object', () => {
    const obj = { a: 1, b: 'two', c: true };
    const cloned = deepClone(obj);
    expect(cloned).toEqual(obj);
    expect(cloned).not.toBe(obj);
  });

  it('nested object', () => {
    const obj = { a: { b: { c: 3 } } };
    const cloned = deepClone(obj);
    expect(cloned).toEqual(obj);
    cloned.a.b.c = 99;
    expect(obj.a.b.c).toBe(3);
  });

  it('arrays', () => {
    const arr = [1, [2, [3]]];
    const cloned = deepClone(arr);
    expect(cloned).toEqual(arr);
    expect(cloned).not.toBe(arr);
    expect(cloned[1]).not.toBe(arr[1]);
  });

  it('Date', () => {
    const date = new Date('2024-01-15');
    const cloned = deepClone(date);
    expect(cloned).toEqual(date);
    expect(cloned).not.toBe(date);
    expect(cloned instanceof Date).toBe(true);
  });

  it('RegExp', () => {
    const re = /test/gi;
    const cloned = deepClone(re);
    expect(cloned.source).toBe(re.source);
    expect(cloned.flags).toBe(re.flags);
    expect(cloned).not.toBe(re);
  });

  it('Map', () => {
    const map = new Map([['a', 1], ['b', { x: 2 }]]);
    const cloned = deepClone(map);
    expect(cloned.get('a')).toBe(1);
    expect(cloned.get('b')).toEqual({ x: 2 });
    expect(cloned.get('b')).not.toBe(map.get('b'));
  });

  it('Set', () => {
    const obj = { a: 1 };
    const set = new Set([1, 'two', obj]);
    const cloned = deepClone(set);
    expect(cloned.size).toBe(3);
    expect(cloned).not.toBe(set);
  });

  it('circular reference', () => {
    const obj: any = { a: 1 };
    obj.self = obj;
    const cloned = deepClone(obj);
    expect(cloned.a).toBe(1);
    expect(cloned.self).toBe(cloned);
    expect(cloned).not.toBe(obj);
  });

  it('complex nested structure', () => {
    const obj = {
      arr: [1, { nested: true }],
      date: new Date(),
      map: new Map([['key', [1, 2, 3]]]),
    };
    const cloned = deepClone(obj);
    expect(cloned).toEqual(obj);
    expect(cloned.arr).not.toBe(obj.arr);
    expect(cloned.date).not.toBe(obj.date);
    expect(cloned.map).not.toBe(obj.map);
  });
});
]==],
  },
  {
    name = "Promise.all Implementation",
    difficulty = "medium",
    stub = [==[
/**
 * Promise.all Implementation
 *
 * Implement your own version of Promise.all().
 *
 * - Takes an array of values/promises
 * - Returns a promise that resolves with an array of results (in order)
 * - If any promise rejects, the returned promise rejects with that reason
 * - Non-promise values should be treated as resolved promises
 */

export function promiseAll<T>(values: (T | Promise<T>)[]): Promise<T[]> {
  // YOUR CODE HERE
  return Promise.reject(new Error('Not implemented'));
}

/**
 * Bonus: Implement promiseAllSettled
 */
export type SettledResult<T> =
  | { status: 'fulfilled'; value: T }
  | { status: 'rejected'; reason: any };

export function promiseAllSettled<T>(values: (T | Promise<T>)[]): Promise<SettledResult<T>[]> {
  // YOUR CODE HERE
  return Promise.reject(new Error('Not implemented'));
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { promiseAll, promiseAllSettled } from './challenge';

describe('promiseAll', () => {
  it('resolves with all values', async () => {
    const result = await promiseAll([1, 2, 3]);
    expect(result).toEqual([1, 2, 3]);
  });

  it('resolves promises in order', async () => {
    const result = await promiseAll([
      Promise.resolve(1),
      Promise.resolve(2),
      Promise.resolve(3),
    ]);
    expect(result).toEqual([1, 2, 3]);
  });

  it('handles mixed values and promises', async () => {
    const result = await promiseAll([1, Promise.resolve(2), 3]);
    expect(result).toEqual([1, 2, 3]);
  });

  it('rejects if any promise rejects', async () => {
    await expect(promiseAll([
      Promise.resolve(1),
      Promise.reject(new Error('fail')),
      Promise.resolve(3),
    ])).rejects.toThrow('fail');
  });

  it('empty array resolves immediately', async () => {
    const result = await promiseAll([]);
    expect(result).toEqual([]);
  });

  it('maintains order with async resolution', async () => {
    const slow = new Promise<number>(r => setTimeout(() => r(1), 50));
    const fast = new Promise<number>(r => setTimeout(() => r(2), 10));
    const result = await promiseAll([slow, fast]);
    expect(result).toEqual([1, 2]);
  });

  it('rejects with first rejection', async () => {
    await expect(promiseAll([
      new Promise((_, r) => setTimeout(() => r(new Error('first')), 10)),
      new Promise((_, r) => setTimeout(() => r(new Error('second')), 50)),
    ])).rejects.toThrow('first');
  });

  it('handles many promises', async () => {
    const promises = Array.from({ length: 100 }, (_, i) => Promise.resolve(i));
    const result = await promiseAll(promises);
    expect(result).toEqual(Array.from({ length: 100 }, (_, i) => i));
  });
});

describe('promiseAllSettled', () => {
  it('returns settled results', async () => {
    const result = await promiseAllSettled([
      Promise.resolve(1),
      Promise.reject('err'),
      Promise.resolve(3),
    ]);
    expect(result).toEqual([
      { status: 'fulfilled', value: 1 },
      { status: 'rejected', reason: 'err' },
      { status: 'fulfilled', value: 3 },
    ]);
  });

  it('empty array', async () => {
    const result = await promiseAllSettled([]);
    expect(result).toEqual([]);
  });

  it('all rejected', async () => {
    const result = await promiseAllSettled([
      Promise.reject('a'),
      Promise.reject('b'),
    ]);
    expect(result).toEqual([
      { status: 'rejected', reason: 'a' },
      { status: 'rejected', reason: 'b' },
    ]);
  });
});
]==],
  },
  {
    name = "Trie (Prefix Tree)",
    difficulty = "hard",
    stub = [==[
/**
 * Trie (Prefix Tree)
 *
 * Implement a trie with the following operations:
 * - insert(word) — Inserts a word into the trie.
 * - search(word) — Returns true if the word is in the trie.
 * - startsWith(prefix) — Returns true if any word starts with the prefix.
 * - delete(word) — Removes a word from the trie.
 * - autocomplete(prefix, limit) — Returns up to `limit` words that start with prefix.
 */

export class Trie {
  insert(word: string): void {
    // YOUR CODE HERE
  }

  search(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  startsWith(prefix: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  autocomplete(prefix: string, limit: number = 5): string[] {
    // YOUR CODE HERE
    return [];
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { Trie } from './challenge';

describe('Trie', () => {
  it('insert and search', () => {
    const t = new Trie();
    t.insert('hello');
    expect(t.search('hello')).toBe(true);
    expect(t.search('hell')).toBe(false);
  });

  it('startsWith', () => {
    const t = new Trie();
    t.insert('hello');
    expect(t.startsWith('hel')).toBe(true);
    expect(t.startsWith('xyz')).toBe(false);
  });

  it('multiple words', () => {
    const t = new Trie();
    t.insert('cat');
    t.insert('car');
    t.insert('card');
    expect(t.search('cat')).toBe(true);
    expect(t.search('car')).toBe(true);
    expect(t.search('card')).toBe(true);
    expect(t.search('ca')).toBe(false);
  });

  it('delete existing word', () => {
    const t = new Trie();
    t.insert('hello');
    expect(t.delete('hello')).toBe(true);
    expect(t.search('hello')).toBe(false);
  });

  it('delete does not affect other words', () => {
    const t = new Trie();
    t.insert('hello');
    t.insert('help');
    t.delete('hello');
    expect(t.search('help')).toBe(true);
    expect(t.startsWith('hel')).toBe(true);
  });

  it('delete non-existent word returns false', () => {
    const t = new Trie();
    expect(t.delete('nope')).toBe(false);
  });

  it('autocomplete', () => {
    const t = new Trie();
    ['apple', 'app', 'application', 'apt', 'bat'].forEach(w => t.insert(w));
    const results = t.autocomplete('app', 10);
    expect(results).toContain('app');
    expect(results).toContain('apple');
    expect(results).toContain('application');
    expect(results).not.toContain('apt');
    expect(results).not.toContain('bat');
  });

  it('autocomplete respects limit', () => {
    const t = new Trie();
    ['a1', 'a2', 'a3', 'a4', 'a5'].forEach(w => t.insert(w));
    expect(t.autocomplete('a', 3).length).toBe(3);
  });

  it('empty trie', () => {
    const t = new Trie();
    expect(t.search('')).toBe(false);
    expect(t.startsWith('')).toBe(true);
    expect(t.autocomplete('', 5)).toEqual([]);
  });

  it('single character words', () => {
    const t = new Trie();
    t.insert('a');
    t.insert('b');
    expect(t.search('a')).toBe(true);
    expect(t.search('b')).toBe(true);
    expect(t.search('c')).toBe(false);
  });

  it('stress: many insertions', () => {
    const t = new Trie();
    for (let i = 0; i < 1000; i++) {
      t.insert('word' + i);
    }
    expect(t.search('word500')).toBe(true);
    expect(t.search('word9999')).toBe(false);
    expect(t.autocomplete('word1', 5).length).toBe(5);
  });
});
]==],
  },
}

  {
    name = "Reactive Observable",
    difficulty = "hard",
    stub = [==[
/**
 * Reactive Observable
 *
 * Implement a minimal reactive Observable (inspired by RxJS) with these operators:
 *
 * Observable class:
 * - constructor(subscribeFn) — Takes a function(observer) where observer has next/error/complete
 * - subscribe(observer) — Starts the observable, returns { unsubscribe: () => void }
 * - pipe(...operators) — Chains operators, returns a new Observable
 *
 * Implement these creation helpers and operators:
 * - of(...values) — Emits each value synchronously, then completes
 * - fromArray(arr) — Emits each element, then completes
 * - map(fn) — Transforms each emitted value
 * - filter(fn) — Only emits values passing the predicate
 * - take(n) — Emits only the first n values, then completes
 * - reduce(fn, seed) — Accumulates values, emits final result on complete
 */

interface Observer<T> {
  next(value: T): void;
  error?(err: any): void;
  complete?(): void;
}

interface Subscription {
  unsubscribe(): void;
}

type Operator<T, R> = (source: Observable<T>) => Observable<R>;

export class Observable<T> {
  constructor(private subscribeFn: (observer: Observer<T>) => (() => void) | void) {
    // YOUR CODE HERE (store subscribeFn)
  }

  subscribe(observer: Partial<Observer<T>>): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {} };
  }

  pipe<R>(...operators: Operator<any, any>[]): Observable<R> {
    // YOUR CODE HERE
    return this as any;
  }
}

export function of<T>(...values: T[]): Observable<T> {
  // YOUR CODE HERE
  return new Observable(() => {});
}

export function fromArray<T>(arr: T[]): Observable<T> {
  // YOUR CODE HERE
  return new Observable(() => {});
}

export function map<T, R>(fn: (value: T) => R): Operator<T, R> {
  // YOUR CODE HERE
  return (source) => source as any;
}

export function filter<T>(predicate: (value: T) => boolean): Operator<T, T> {
  // YOUR CODE HERE
  return (source) => source;
}

export function take<T>(count: number): Operator<T, T> {
  // YOUR CODE HERE
  return (source) => source;
}

export function reduce<T, R>(accumulator: (acc: R, value: T) => R, seed: R): Operator<T, R> {
  // YOUR CODE HERE
  return (source) => source as any;
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { Observable, of, fromArray, map, filter, take, reduce } from './challenge';

describe('Reactive Observable', () => {
  it('of emits values and completes', () => {
    const next = vi.fn();
    const complete = vi.fn();
    of(1, 2, 3).subscribe({ next, complete });
    expect(next).toHaveBeenCalledTimes(3);
    expect(next).toHaveBeenNthCalledWith(1, 1);
    expect(next).toHaveBeenNthCalledWith(2, 2);
    expect(next).toHaveBeenNthCalledWith(3, 3);
    expect(complete).toHaveBeenCalledOnce();
  });

  it('fromArray emits array elements', () => {
    const values: number[] = [];
    fromArray([10, 20, 30]).subscribe({ next: v => values.push(v) });
    expect(values).toEqual([10, 20, 30]);
  });

  it('map transforms values', () => {
    const values: number[] = [];
    of(1, 2, 3).pipe(map((x: number) => x * 10)).subscribe({ next: v => values.push(v) });
    expect(values).toEqual([10, 20, 30]);
  });

  it('filter selects values', () => {
    const values: number[] = [];
    of(1, 2, 3, 4, 5).pipe(filter((x: number) => x % 2 === 0)).subscribe({ next: v => values.push(v) });
    expect(values).toEqual([2, 4]);
  });

  it('take limits emissions', () => {
    const next = vi.fn();
    const complete = vi.fn();
    of(1, 2, 3, 4, 5).pipe(take(3)).subscribe({ next, complete });
    expect(next).toHaveBeenCalledTimes(3);
    expect(complete).toHaveBeenCalledOnce();
  });

  it('reduce accumulates and emits on complete', () => {
    const next = vi.fn();
    of(1, 2, 3, 4).pipe(reduce((acc: number, x: number) => acc + x, 0)).subscribe({ next });
    expect(next).toHaveBeenCalledOnce();
    expect(next).toHaveBeenCalledWith(10);
  });

  it('pipe chains multiple operators', () => {
    const values: number[] = [];
    of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
      .pipe(
        filter((x: number) => x % 2 === 0),
        map((x: number) => x * 100),
        take(3)
      )
      .subscribe({ next: v => values.push(v) });
    expect(values).toEqual([200, 400, 600]);
  });

  it('unsubscribe stops emissions from custom observable', () => {
    let emitCount = 0;
    const obs = new Observable<number>((observer) => {
      let i = 0;
      const id = setInterval(() => { observer.next(i++); }, 1);
      return () => clearInterval(id);
    });
    const next = vi.fn(() => { emitCount++; });
    const sub = obs.subscribe({ next });
    setTimeout(() => sub.unsubscribe(), 50);
    return new Promise<void>((resolve) => {
      setTimeout(() => {
        const count = emitCount;
        setTimeout(() => {
          expect(emitCount).toBe(count);
          resolve();
        }, 30);
      }, 80);
    });
  });

  it('error propagates to observer', () => {
    const error = vi.fn();
    const obs = new Observable<number>((observer) => {
      observer.next(1);
      observer.error!(new Error('boom'));
      observer.next(2);
    });
    const next = vi.fn();
    obs.subscribe({ next, error });
    expect(next).toHaveBeenCalledTimes(1);
    expect(error).toHaveBeenCalledOnce();
  });

  it('of with no arguments just completes', () => {
    const next = vi.fn();
    const complete = vi.fn();
    of().subscribe({ next, complete });
    expect(next).not.toHaveBeenCalled();
    expect(complete).toHaveBeenCalledOnce();
  });

  it('reduce with empty source emits seed', () => {
    const next = vi.fn();
    of<number>().pipe(reduce((acc: number, x: number) => acc + x, 42)).subscribe({ next });
    expect(next).toHaveBeenCalledWith(42);
  });

  it('stress: large pipeline', () => {
    const values: number[] = [];
    fromArray(Array.from({ length: 10000 }, (_, i) => i))
      .pipe(
        filter((x: number) => x % 3 === 0),
        map((x: number) => x / 3),
        take(100)
      )
      .subscribe({ next: v => values.push(v) });
    expect(values.length).toBe(100);
    expect(values[0]).toBe(0);
    expect(values[99]).toBe(99);
  });
});
]==],
  },
}

--- Deterministic challenge selection based on date.
--- Cycles sequentially through challenges using day-of-year.
function M.get_challenge_for_date(date_str)
  local y, m, d = date_str:match('(%d+)-(%d+)-(%d+)')
  if y and m and d then
    local t = os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })
    local jan1 = os.time({ year = tonumber(y), month = 1, day = 1 })
    local day_of_year = math.floor((t - jan1) / 86400)
    local idx = (day_of_year % #M.challenges) + 1
    return M.challenges[idx]
  end
  local seed = 0
  for i = 1, #date_str do
    seed = seed * 31 + string.byte(date_str, i)
  end
  local idx = (seed % #M.challenges) + 1
  return M.challenges[idx]
end

return M
