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
  {
    name = "Topological Sort",
    difficulty = "medium",
    stub = [==[
/**
 * Topological Sort
 *
 * Given a directed acyclic graph (DAG) represented as an adjacency list,
 * return a valid topological ordering of all nodes.
 *
 * If the graph contains a cycle, throw an Error('Cycle detected').
 *
 * @param numNodes — number of nodes (labeled 0 to numNodes-1)
 * @param edges — array of [from, to] pairs meaning "from must come before to"
 * @returns array of node labels in a valid topological order
 *
 * Example:
 *   topoSort(4, [[0,1],[0,2],[1,3],[2,3]]) => [0,2,1,3] or [0,1,2,3]
 *
 * Bonus: Implement Kahn's algorithm (BFS-based) as an alternative.
 */

export function topoSort(numNodes: number, edges: [number, number][]): number[] {
  // YOUR CODE HERE
  return [];
}

/**
 * Bonus: Given a list of tasks with dependencies, return a valid execution order.
 * Each task is { id: string, deps: string[] }.
 * Throw if there's a circular dependency.
 */
export interface Task {
  id: string;
  deps: string[];
}

export function taskOrder(tasks: Task[]): string[] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { topoSort, taskOrder } from './challenge';

function isValidTopo(numNodes: number, edges: [number, number][], order: number[]): boolean {
  if (order.length !== numNodes) return false;
  const pos = new Map<number, number>();
  order.forEach((node, i) => pos.set(node, i));
  if (pos.size !== numNodes) return false;
  return edges.every(([u, v]) => (pos.get(u)!) < (pos.get(v)!));
}

describe('Topological Sort', () => {
  it('simple DAG', () => {
    const result = topoSort(4, [[0,1],[0,2],[1,3],[2,3]]);
    expect(isValidTopo(4, [[0,1],[0,2],[1,3],[2,3]], result)).toBe(true);
  });

  it('linear chain', () => {
    const result = topoSort(4, [[0,1],[1,2],[2,3]]);
    expect(result).toEqual([0,1,2,3]);
  });

  it('no edges', () => {
    const result = topoSort(3, []);
    expect(result.sort()).toEqual([0,1,2]);
  });

  it('single node', () => {
    expect(topoSort(1, [])).toEqual([0]);
  });

  it('diamond shape', () => {
    const edges: [number, number][] = [[0,1],[0,2],[1,3],[2,3]];
    const result = topoSort(4, edges);
    expect(isValidTopo(4, edges, result)).toBe(true);
  });

  it('detects cycle', () => {
    expect(() => topoSort(3, [[0,1],[1,2],[2,0]])).toThrow('Cycle detected');
  });

  it('detects self-loop', () => {
    expect(() => topoSort(2, [[0,0]])).toThrow('Cycle detected');
  });

  it('complex DAG', () => {
    const edges: [number, number][] = [[5,2],[5,0],[4,0],[4,1],[2,3],[3,1]];
    const result = topoSort(6, edges);
    expect(isValidTopo(6, edges, result)).toBe(true);
  });

  it('stress: large DAG', () => {
    const n = 1000;
    const edges: [number, number][] = [];
    for (let i = 0; i < n - 1; i++) edges.push([i, i + 1]);
    const result = topoSort(n, edges);
    expect(result).toEqual(Array.from({ length: n }, (_, i) => i));
  });
});

describe('Task Order', () => {
  it('simple dependencies', () => {
    const tasks = [
      { id: 'build', deps: ['compile'] },
      { id: 'compile', deps: ['parse'] },
      { id: 'parse', deps: [] },
    ];
    const order = taskOrder(tasks);
    expect(order.indexOf('parse')).toBeLessThan(order.indexOf('compile'));
    expect(order.indexOf('compile')).toBeLessThan(order.indexOf('build'));
  });

  it('no dependencies', () => {
    const tasks = [{ id: 'a', deps: [] }, { id: 'b', deps: [] }];
    expect(taskOrder(tasks).sort()).toEqual(['a', 'b']);
  });

  it('circular dependency throws', () => {
    const tasks = [
      { id: 'a', deps: ['b'] },
      { id: 'b', deps: ['a'] },
    ];
    expect(() => taskOrder(tasks)).toThrow();
  });
});
]==],
  },
  {
    name = "Async Task Scheduler",
    difficulty = "hard",
    stub = [==[
/**
 * Async Task Scheduler
 *
 * Implement a task scheduler that limits the number of concurrently running async tasks.
 *
 * Scheduler class:
 * - constructor(concurrency: number) — Max number of tasks running at once.
 * - add(task: () => Promise<T>): Promise<T> — Queues a task. Returns a promise that
 *   resolves/rejects with the task's result. If under the concurrency limit, starts immediately.
 *   Otherwise waits until a slot opens.
 * - waitForAll(): Promise<void> — Resolves when all queued and running tasks are done.
 * - get pending(): number — Number of tasks waiting in the queue.
 * - get running(): number — Number of currently executing tasks.
 *
 * Tasks must start in FIFO order. If a task rejects, the scheduler continues running
 * other tasks — the rejection only propagates to that task's returned promise.
 */

export class AsyncScheduler {
  constructor(concurrency: number) {
    // YOUR CODE HERE
  }

  add<T>(task: () => Promise<T>): Promise<T> {
    // YOUR CODE HERE
    return Promise.reject(new Error('Not implemented'));
  }

  waitForAll(): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }

  get pending(): number {
    // YOUR CODE HERE
    return 0;
  }

  get running(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { AsyncScheduler } from './challenge';

const delay = (ms: number) => new Promise(r => setTimeout(r, ms));

describe('Async Task Scheduler', () => {
  it('runs tasks up to concurrency limit', async () => {
    const scheduler = new AsyncScheduler(2);
    let concurrent = 0;
    let maxConcurrent = 0;

    const makeTask = (ms: number) => () => {
      concurrent++;
      maxConcurrent = Math.max(maxConcurrent, concurrent);
      return delay(ms).then(() => { concurrent--; });
    };

    scheduler.add(makeTask(50));
    scheduler.add(makeTask(50));
    scheduler.add(makeTask(50));
    scheduler.add(makeTask(50));
    await scheduler.waitForAll();
    expect(maxConcurrent).toBe(2);
  });

  it('returns task result', async () => {
    const scheduler = new AsyncScheduler(1);
    const result = await scheduler.add(() => Promise.resolve(42));
    expect(result).toBe(42);
  });

  it('propagates rejection to caller', async () => {
    const scheduler = new AsyncScheduler(2);
    const p1 = scheduler.add(() => Promise.reject(new Error('boom')));
    const p2 = scheduler.add(() => Promise.resolve('ok'));
    await expect(p1).rejects.toThrow('boom');
    expect(await p2).toBe('ok');
  });

  it('tasks run in FIFO order', async () => {
    const scheduler = new AsyncScheduler(1);
    const order: number[] = [];
    scheduler.add(async () => { order.push(1); });
    scheduler.add(async () => { order.push(2); });
    scheduler.add(async () => { order.push(3); });
    await scheduler.waitForAll();
    expect(order).toEqual([1, 2, 3]);
  });

  it('pending and running counts', async () => {
    const scheduler = new AsyncScheduler(1);
    let resolve1!: () => void;
    const blocker = new Promise<void>(r => { resolve1 = r; });

    scheduler.add(() => blocker);
    scheduler.add(() => delay(1));
    scheduler.add(() => delay(1));

    await delay(5);
    expect(scheduler.running).toBe(1);
    expect(scheduler.pending).toBe(2);

    resolve1();
    await scheduler.waitForAll();
    expect(scheduler.running).toBe(0);
    expect(scheduler.pending).toBe(0);
  });

  it('concurrency of 1 is sequential', async () => {
    const scheduler = new AsyncScheduler(1);
    const log: string[] = [];
    scheduler.add(async () => { log.push('a-start'); await delay(20); log.push('a-end'); });
    scheduler.add(async () => { log.push('b-start'); await delay(10); log.push('b-end'); });
    await scheduler.waitForAll();
    expect(log).toEqual(['a-start', 'a-end', 'b-start', 'b-end']);
  });

  it('high concurrency runs all at once', async () => {
    const scheduler = new AsyncScheduler(100);
    let concurrent = 0;
    let maxConcurrent = 0;

    const tasks = Array.from({ length: 20 }, () =>
      scheduler.add(async () => {
        concurrent++;
        maxConcurrent = Math.max(maxConcurrent, concurrent);
        await delay(10);
        concurrent--;
      })
    );
    await Promise.all(tasks);
    expect(maxConcurrent).toBe(20);
  });

  it('waitForAll resolves immediately when empty', async () => {
    const scheduler = new AsyncScheduler(3);
    await scheduler.waitForAll();
  });

  it('failed task does not block queue', async () => {
    const scheduler = new AsyncScheduler(1);
    const results: string[] = [];
    const p1 = scheduler.add(async () => { throw new Error('fail'); });
    scheduler.add(async () => { results.push('done'); });
    await p1.catch(() => {});
    await scheduler.waitForAll();
    expect(results).toEqual(['done']);
  });

  it('stress: many tasks', async () => {
    const scheduler = new AsyncScheduler(5);
    let sum = 0;
    const promises = Array.from({ length: 100 }, (_, i) =>
      scheduler.add(async () => { sum += i; return i; })
    );
    const results = await Promise.all(promises);
    expect(results).toEqual(Array.from({ length: 100 }, (_, i) => i));
    expect(sum).toBe(4950);
  });
});
]==],
  },
  {
    name = "Sliding Window Rate Limiter",
    difficulty = "medium",
    stub = [==[
/**
 * Sliding Window Rate Limiter
 *
 * Implement a rate limiter using the sliding window log algorithm.
 *
 * RateLimiter class:
 * - constructor(maxRequests: number, windowMs: number)
 *   maxRequests = max allowed in the sliding window
 *   windowMs = window size in milliseconds
 *
 * - tryAcquire(key: string, now?: number): boolean
 *   Returns true if the request is allowed, false if rate-limited.
 *   `now` defaults to Date.now() — passing it explicitly makes testing easier.
 *
 * - reset(key: string): void
 *   Clears all history for a key.
 *
 * - getRemaining(key: string, now?: number): number
 *   Returns how many requests are still available in the current window.
 *
 * Bonus: Implement a fixed-window counter variant as well.
 */

export class RateLimiter {
  constructor(private maxRequests: number, private windowMs: number) {
    // YOUR CODE HERE
  }

  tryAcquire(key: string, now?: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  reset(key: string): void {
    // YOUR CODE HERE
  }

  getRemaining(key: string, now?: number): number {
    // YOUR CODE HERE
    return 0;
  }
}

/**
 * Bonus: Fixed-window counter rate limiter.
 * Simpler but less smooth — requests at window boundaries can spike to 2x.
 */
export class FixedWindowLimiter {
  constructor(private maxRequests: number, private windowMs: number) {
    // YOUR CODE HERE
  }

  tryAcquire(key: string, now?: number): boolean {
    // YOUR CODE HERE
    return false;
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { RateLimiter, FixedWindowLimiter } from './challenge';

describe('Sliding Window Rate Limiter', () => {
  it('allows requests under limit', () => {
    const rl = new RateLimiter(3, 1000);
    expect(rl.tryAcquire('user1', 0)).toBe(true);
    expect(rl.tryAcquire('user1', 100)).toBe(true);
    expect(rl.tryAcquire('user1', 200)).toBe(true);
  });

  it('blocks requests over limit', () => {
    const rl = new RateLimiter(2, 1000);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 100)).toBe(true);
    expect(rl.tryAcquire('u', 200)).toBe(false);
  });

  it('allows again after window slides', () => {
    const rl = new RateLimiter(2, 1000);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 500)).toBe(true);
    expect(rl.tryAcquire('u', 800)).toBe(false);
    expect(rl.tryAcquire('u', 1001)).toBe(true);
  });

  it('keys are independent', () => {
    const rl = new RateLimiter(1, 1000);
    expect(rl.tryAcquire('a', 0)).toBe(true);
    expect(rl.tryAcquire('b', 0)).toBe(true);
    expect(rl.tryAcquire('a', 100)).toBe(false);
    expect(rl.tryAcquire('b', 100)).toBe(false);
  });

  it('reset clears history', () => {
    const rl = new RateLimiter(1, 1000);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 100)).toBe(false);
    rl.reset('u');
    expect(rl.tryAcquire('u', 200)).toBe(true);
  });

  it('getRemaining returns correct count', () => {
    const rl = new RateLimiter(5, 1000);
    expect(rl.getRemaining('u', 0)).toBe(5);
    rl.tryAcquire('u', 0);
    rl.tryAcquire('u', 100);
    expect(rl.getRemaining('u', 200)).toBe(3);
  });

  it('getRemaining reflects window sliding', () => {
    const rl = new RateLimiter(2, 1000);
    rl.tryAcquire('u', 0);
    rl.tryAcquire('u', 100);
    expect(rl.getRemaining('u', 500)).toBe(0);
    expect(rl.getRemaining('u', 1001)).toBe(1);
    expect(rl.getRemaining('u', 1101)).toBe(2);
  });

  it('expired entries are cleaned up', () => {
    const rl = new RateLimiter(3, 100);
    rl.tryAcquire('u', 0);
    rl.tryAcquire('u', 50);
    rl.tryAcquire('u', 99);
    expect(rl.tryAcquire('u', 100)).toBe(false);
    expect(rl.tryAcquire('u', 101)).toBe(true);
  });

  it('stress: rapid requests', () => {
    const rl = new RateLimiter(100, 1000);
    let allowed = 0;
    for (let i = 0; i < 200; i++) {
      if (rl.tryAcquire('u', i)) allowed++;
    }
    expect(allowed).toBe(100);
  });

  it('single request window', () => {
    const rl = new RateLimiter(1, 50);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 25)).toBe(false);
    expect(rl.tryAcquire('u', 51)).toBe(true);
  });
});

describe('Fixed Window Limiter', () => {
  it('allows within window', () => {
    const rl = new FixedWindowLimiter(2, 1000);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 500)).toBe(true);
    expect(rl.tryAcquire('u', 999)).toBe(false);
  });

  it('resets at window boundary', () => {
    const rl = new FixedWindowLimiter(1, 1000);
    expect(rl.tryAcquire('u', 0)).toBe(true);
    expect(rl.tryAcquire('u', 500)).toBe(false);
    expect(rl.tryAcquire('u', 1000)).toBe(true);
  });
});
]==],
  },
  {
    name = "Curry Function",
    difficulty = "medium",
    stub = [==[
/**
 * Curry Function
 *
 * Implement a generic `curry` function that transforms a multi-argument function
 * into a chain of single-argument (or partial-argument) functions.
 *
 * Requirements:
 * - curry(fn) returns a curried version of fn
 * - The curried function can be called with any number of arguments at each step
 * - When enough arguments have been collected (>= fn.length), call the original function
 * - Support placeholder `_` for partial application in any position
 *
 * Examples:
 *   const add = (a: number, b: number, c: number) => a + b + c;
 *   const curried = curry(add);
 *   curried(1)(2)(3)    // => 6
 *   curried(1, 2)(3)    // => 6
 *   curried(1)(2, 3)    // => 6
 *   curried(1, 2, 3)    // => 6
 *
 * With placeholders:
 *   curried(_, 2, 3)(1) // => 6
 *   curried(_, _, 3)(1)(2) // => 6
 */

export const _ = Symbol('placeholder');

type Placeholder = typeof _;

export function curry(fn: (...args: any[]) => any): (...args: any[]) => any {
  // YOUR CODE HERE
  return fn;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { curry, _ } from './challenge';

describe('Curry Function', () => {
  const add3 = (a: number, b: number, c: number) => a + b + c;

  it('basic currying one arg at a time', () => {
    const curried = curry(add3);
    expect(curried(1)(2)(3)).toBe(6);
  });

  it('all args at once', () => {
    const curried = curry(add3);
    expect(curried(1, 2, 3)).toBe(6);
  });

  it('partial args', () => {
    const curried = curry(add3);
    expect(curried(1, 2)(3)).toBe(6);
    expect(curried(1)(2, 3)).toBe(6);
  });

  it('zero-arg function', () => {
    const greet = () => 'hello';
    const curried = curry(greet);
    expect(curried()).toBe('hello');
  });

  it('single-arg function', () => {
    const double = (x: number) => x * 2;
    const curried = curry(double);
    expect(curried(5)).toBe(10);
  });

  it('placeholder in first position', () => {
    const curried = curry(add3);
    expect(curried(_, 2, 3)(1)).toBe(6);
  });

  it('placeholder in middle position', () => {
    const curried = curry(add3);
    expect(curried(1, _, 3)(2)).toBe(6);
  });

  it('multiple placeholders', () => {
    const curried = curry(add3);
    expect(curried(_, _, 3)(1)(2)).toBe(6);
  });

  it('all placeholders', () => {
    const curried = curry(add3);
    expect(curried(_, _, _)(1)(2)(3)).toBe(6);
  });

  it('placeholder filled with partial args', () => {
    const curried = curry(add3);
    expect(curried(_, _, 3)(1, 2)).toBe(6);
  });

  it('preserves function context', () => {
    const fn = (a: string, b: string) => a + b;
    const curried = curry(fn);
    expect(curried('hello, ')('world')).toBe('hello, world');
  });

  it('stress: many arguments', () => {
    const sum = (...args: number[]) => {
      let s = 0; for (const a of args) s += a; return s;
    };
    // Create a function with explicit length
    const sum5 = (a: number, b: number, c: number, d: number, e: number) => a + b + c + d + e;
    const curried = curry(sum5);
    expect(curried(1)(2)(3)(4)(5)).toBe(15);
    expect(curried(1, 2, 3, 4, 5)).toBe(15);
    expect(curried(1, 2)(3, 4)(5)).toBe(15);
  });
});
]==],
  },
  {
    name = "Memoize with TTL",
    difficulty = "medium",
    stub = [==[
/**
 * Memoize with TTL
 *
 * Implement a memoization function with time-to-live (TTL) cache expiration.
 *
 * memoize(fn, options):
 * - Caches results keyed by stringified arguments
 * - `ttl` (ms): cached values expire after this duration
 * - `maxSize` (optional): max number of cached entries (evict oldest on overflow)
 *
 * The returned function also has:
 * - cache.clear() — manually clear all cached entries
 * - cache.size — number of currently cached (non-expired) entries
 * - cache.has(...args) — check if a non-expired cache entry exists for these args
 *
 * Expired entries should be lazily cleaned up (on access), not via timers.
 */

interface MemoizeOptions {
  ttl: number;
  maxSize?: number;
}

interface MemoizedFn<T extends (...args: any[]) => any> {
  (...args: Parameters<T>): ReturnType<T>;
  cache: {
    clear(): void;
    size: number;
    has(...args: Parameters<T>): boolean;
  };
}

export function memoize<T extends (...args: any[]) => any>(
  fn: T,
  options: MemoizeOptions
): MemoizedFn<T> {
  // YOUR CODE HERE
  const noop = (() => fn()) as any;
  noop.cache = { clear: () => {}, size: 0, has: () => false };
  return noop;
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { memoize } from './challenge';

describe('Memoize with TTL', () => {
  beforeEach(() => { vi.useFakeTimers(); });
  afterEach(() => { vi.restoreAllTimers(); });

  it('caches function results', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memo = memoize(fn, { ttl: 1000 });
    expect(memo(5)).toBe(10);
    expect(memo(5)).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('different args get different cache entries', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memo = memoize(fn, { ttl: 1000 });
    expect(memo(1)).toBe(2);
    expect(memo(2)).toBe(4);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('expires after TTL', () => {
    const fn = vi.fn((x: number) => x + 1);
    const memo = memoize(fn, { ttl: 100 });
    expect(memo(1)).toBe(2);
    vi.advanceTimersByTime(101);
    expect(memo(1)).toBe(2);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('non-expired entries stay cached', () => {
    const fn = vi.fn((x: number) => x);
    const memo = memoize(fn, { ttl: 200 });
    memo(1);
    vi.advanceTimersByTime(100);
    memo(1);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('cache.clear removes all entries', () => {
    const fn = vi.fn((x: number) => x);
    const memo = memoize(fn, { ttl: 5000 });
    memo(1);
    memo(2);
    memo.cache.clear();
    expect(memo.cache.size).toBe(0);
    memo(1);
    expect(fn).toHaveBeenCalledTimes(3);
  });

  it('cache.size reflects non-expired count', () => {
    const fn = vi.fn((x: number) => x);
    const memo = memoize(fn, { ttl: 100 });
    memo(1);
    memo(2);
    expect(memo.cache.size).toBe(2);
    vi.advanceTimersByTime(101);
    expect(memo.cache.size).toBe(0);
  });

  it('cache.has checks for non-expired entries', () => {
    const fn = (x: number) => x;
    const memo = memoize(fn, { ttl: 100 });
    memo(42);
    expect(memo.cache.has(42)).toBe(true);
    expect(memo.cache.has(99)).toBe(false);
    vi.advanceTimersByTime(101);
    expect(memo.cache.has(42)).toBe(false);
  });

  it('maxSize evicts oldest entry', () => {
    const fn = vi.fn((x: number) => x);
    const memo = memoize(fn, { ttl: 5000, maxSize: 2 });
    memo(1);
    memo(2);
    memo(3); // should evict key for arg 1
    expect(memo.cache.has(1)).toBe(false);
    expect(memo.cache.has(2)).toBe(true);
    expect(memo.cache.has(3)).toBe(true);
  });

  it('multiple arguments as cache key', () => {
    const fn = vi.fn((a: number, b: string) => `${a}-${b}`);
    const memo = memoize(fn, { ttl: 1000 });
    expect(memo(1, 'a')).toBe('1-a');
    expect(memo(1, 'a')).toBe('1-a');
    expect(memo(1, 'b')).toBe('1-b');
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('re-caches after expiry with fresh value', () => {
    let counter = 0;
    const fn = vi.fn(() => ++counter);
    const memo = memoize(fn, { ttl: 50 });
    expect(memo()).toBe(1);
    vi.advanceTimersByTime(51);
    expect(memo()).toBe(2);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('stress: many entries with maxSize', () => {
    const fn = vi.fn((x: number) => x * x);
    const memo = memoize(fn, { ttl: 10000, maxSize: 50 });
    for (let i = 0; i < 200; i++) {
      memo(i);
    }
    expect(memo.cache.size).toBe(50);
    // oldest should be evicted, newest should remain
    expect(memo.cache.has(199)).toBe(true);
    expect(memo.cache.has(0)).toBe(false);
  });
});
]==],
  },
  {
    name = "Pipe and Compose",
    difficulty = "easy",
    stub = [==[
/**
 * Pipe and Compose
 *
 * Implement two function composition utilities:
 *
 * pipe(...fns) — Returns a function that applies fns left-to-right.
 *   pipe(f, g, h)(x) === h(g(f(x)))
 *
 * compose(...fns) — Returns a function that applies fns right-to-left.
 *   compose(f, g, h)(x) === f(g(h(x)))
 *
 * Rules:
 * - If no functions are provided, return the identity function (x => x)
 * - If one function is provided, return it directly
 * - Each function in the chain takes a single argument (unary)
 *
 * Bonus: Implement asyncPipe that works with async functions (each fn can
 * return a value or a Promise).
 */

type Fn = (arg: any) => any;
type AsyncFn = (arg: any) => any | Promise<any>;

export function pipe(...fns: Fn[]): Fn {
  // YOUR CODE HERE
  return (x) => x;
}

export function compose(...fns: Fn[]): Fn {
  // YOUR CODE HERE
  return (x) => x;
}

export function asyncPipe(...fns: AsyncFn[]): (arg: any) => Promise<any> {
  // YOUR CODE HERE
  return async (x) => x;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { pipe, compose, asyncPipe } from './challenge';

describe('Pipe', () => {
  it('applies functions left to right', () => {
    const add1 = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    expect(pipe(add1, double)(5)).toBe(12); // (5+1)*2
  });

  it('single function returns it directly', () => {
    const add1 = (x: number) => x + 1;
    expect(pipe(add1)(10)).toBe(11);
  });

  it('no functions returns identity', () => {
    expect(pipe()(42)).toBe(42);
    expect(pipe()('hello')).toBe('hello');
  });

  it('three functions', () => {
    const add1 = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    const square = (x: number) => x * x;
    expect(pipe(add1, double, square)(3)).toBe(64); // ((3+1)*2)^2
  });

  it('works with strings', () => {
    const upper = (s: string) => s.toUpperCase();
    const exclaim = (s: string) => s + '!';
    const trim = (s: string) => s.trim();
    expect(pipe(trim, upper, exclaim)('  hello  ')).toBe('HELLO!');
  });

  it('many functions', () => {
    const fns = Array.from({ length: 100 }, () => (x: number) => x + 1);
    expect(pipe(...fns)(0)).toBe(100);
  });
});

describe('Compose', () => {
  it('applies functions right to left', () => {
    const add1 = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    expect(compose(add1, double)(5)).toBe(11); // (5*2)+1
  });

  it('single function returns it directly', () => {
    const double = (x: number) => x * 2;
    expect(compose(double)(7)).toBe(14);
  });

  it('no functions returns identity', () => {
    expect(compose()(99)).toBe(99);
  });

  it('compose is reverse of pipe', () => {
    const add1 = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    const square = (x: number) => x * x;
    // pipe(add1, double, square)(3) = square(double(add1(3))) = 64
    // compose(square, double, add1)(3) = square(double(add1(3))) = 64
    expect(compose(square, double, add1)(3)).toBe(64);
  });

  it('works with type conversions', () => {
    const toStr = (x: number) => String(x);
    const len = (s: string) => s.length;
    expect(compose(len, toStr)(12345)).toBe(5);
  });
});

describe('Async Pipe', () => {
  it('handles sync functions', async () => {
    const add1 = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    expect(await asyncPipe(add1, double)(5)).toBe(12);
  });

  it('handles async functions', async () => {
    const asyncAdd1 = async (x: number) => x + 1;
    const asyncDouble = async (x: number) => x * 2;
    expect(await asyncPipe(asyncAdd1, asyncDouble)(5)).toBe(12);
  });

  it('handles mixed sync and async', async () => {
    const add1 = (x: number) => x + 1;
    const asyncDouble = async (x: number) => x * 2;
    expect(await asyncPipe(add1, asyncDouble)(5)).toBe(12);
  });

  it('no functions returns identity', async () => {
    expect(await asyncPipe()(42)).toBe(42);
  });

  it('propagates errors', async () => {
    const fail = async () => { throw new Error('boom'); };
    await expect(asyncPipe(fail)('x')).rejects.toThrow('boom');
  });
});
]==],
  },
  {
    name = "Min Heap (Priority Queue)",
    difficulty = "medium",
    stub = [==[
/**
 * Min Heap (Priority Queue)
 *
 * Implement a binary min-heap that supports:
 * - insert(value) — Add a value to the heap. O(log n)
 * - extractMin() — Remove and return the minimum value. O(log n)
 * - peek() — Return the minimum value without removing it. O(1)
 * - size — Number of elements in the heap
 *
 * The heap should maintain the min-heap property:
 * Every parent node has a value <= its children.
 *
 * Bonus: Implement heapify(arr) to build a heap from an array in O(n) time.
 */

export class MinHeap {
  constructor() {
    // YOUR CODE HERE
  }

  insert(value: number): void {
    // YOUR CODE HERE
  }

  extractMin(): number | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  peek(): number | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  get size(): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Build heap from array in O(n)
   */
  static heapify(arr: number[]): MinHeap {
    // YOUR CODE HERE
    return new MinHeap();
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { MinHeap } from './challenge';

describe('Min Heap', () => {
  it('insert and peek', () => {
    const heap = new MinHeap();
    heap.insert(5);
    expect(heap.peek()).toBe(5);
    heap.insert(3);
    expect(heap.peek()).toBe(3);
  });

  it('extractMin returns minimum', () => {
    const heap = new MinHeap();
    heap.insert(10);
    heap.insert(5);
    heap.insert(15);
    expect(heap.extractMin()).toBe(5);
    expect(heap.extractMin()).toBe(10);
    expect(heap.extractMin()).toBe(15);
  });

  it('maintains heap property after insertions', () => {
    const heap = new MinHeap();
    [7, 3, 9, 1, 5].forEach(v => heap.insert(v));
    expect(heap.peek()).toBe(1);
  });

  it('size updates correctly', () => {
    const heap = new MinHeap();
    expect(heap.size).toBe(0);
    heap.insert(1);
    heap.insert(2);
    expect(heap.size).toBe(2);
    heap.extractMin();
    expect(heap.size).toBe(1);
  });

  it('extractMin on empty heap returns undefined', () => {
    const heap = new MinHeap();
    expect(heap.extractMin()).toBe(undefined);
  });

  it('peek on empty heap returns undefined', () => {
    const heap = new MinHeap();
    expect(heap.peek()).toBe(undefined);
  });

  it('maintains order with duplicates', () => {
    const heap = new MinHeap();
    [5, 3, 5, 1, 3].forEach(v => heap.insert(v));
    const result = [];
    while (heap.size > 0) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 3, 3, 5, 5]);
  });

  it('single element', () => {
    const heap = new MinHeap();
    heap.insert(42);
    expect(heap.peek()).toBe(42);
    expect(heap.extractMin()).toBe(42);
    expect(heap.size).toBe(0);
  });

  it('alternating insert and extract', () => {
    const heap = new MinHeap();
    heap.insert(5);
    heap.insert(2);
    expect(heap.extractMin()).toBe(2);
    heap.insert(8);
    heap.insert(1);
    expect(heap.extractMin()).toBe(1);
    expect(heap.extractMin()).toBe(5);
  });

  it('stress: many insertions', () => {
    const heap = new MinHeap();
    const values = Array.from({ length: 1000 }, () => Math.floor(Math.random() * 10000));
    values.forEach(v => heap.insert(v));
    expect(heap.size).toBe(1000);
    
    const sorted = [];
    while (heap.size > 0) {
      sorted.push(heap.extractMin()!);
    }
    const expectedSorted = [...values].sort((a, b) => a - b);
    expect(sorted).toEqual(expectedSorted);
  });

  it('negative numbers', () => {
    const heap = new MinHeap();
    [-5, 3, -10, 0, 7].forEach(v => heap.insert(v));
    expect(heap.extractMin()).toBe(-10);
    expect(heap.extractMin()).toBe(-5);
  });

  it('heapify builds heap from array', () => {
    const heap = MinHeap.heapify([9, 5, 7, 1, 3]);
    expect(heap.peek()).toBe(1);
    expect(heap.size).toBe(5);
    const result = [];
    while (heap.size > 0) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 3, 5, 7, 9]);
  });

  it('heapify empty array', () => {
    const heap = MinHeap.heapify([]);
    expect(heap.size).toBe(0);
    expect(heap.peek()).toBe(undefined);
  });

  it('heapify single element', () => {
    const heap = MinHeap.heapify([42]);
    expect(heap.peek()).toBe(42);
  });
});
]==],
  },
  {
    name = "Merge Intervals",
    difficulty = "medium",
    stub = [==[
/**
 * Merge Intervals
 *
 * Given an array of intervals where intervals[i] = [start, end],
 * merge all overlapping intervals and return an array of the
 * non-overlapping intervals that cover all the intervals in the input.
 *
 * Example: merge([[1,3],[2,6],[8,10],[15,18]]) => [[1,6],[8,10],[15,18]]
 *
 * Bonus: Implement insertInterval that inserts a new interval into a
 * sorted, non-overlapping list and merges if necessary — without
 * re-sorting the entire array.
 */

export function merge(intervals: [number, number][]): [number, number][] {
  // YOUR CODE HERE
  return [];
}

/**
 * Bonus: Insert a new interval into a sorted non-overlapping list.
 * The input intervals are already sorted by start time and non-overlapping.
 * Return the new list after inserting and merging.
 */
export function insertInterval(
  intervals: [number, number][],
  newInterval: [number, number]
): [number, number][] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { merge, insertInterval } from './challenge';

describe('Merge Intervals', () => {
  it('basic overlapping', () => {
    expect(merge([[1,3],[2,6],[8,10],[15,18]])).toEqual([[1,6],[8,10],[15,18]]);
  });

  it('fully overlapping', () => {
    expect(merge([[1,4],[2,3]])).toEqual([[1,4]]);
  });

  it('adjacent intervals', () => {
    expect(merge([[1,2],[2,3],[3,4]])).toEqual([[1,4]]);
  });

  it('no overlap', () => {
    expect(merge([[1,2],[5,6],[9,10]])).toEqual([[1,2],[5,6],[9,10]]);
  });

  it('single interval', () => {
    expect(merge([[1,5]])).toEqual([[1,5]]);
  });

  it('empty input', () => {
    expect(merge([])).toEqual([]);
  });

  it('unsorted input', () => {
    expect(merge([[3,5],[1,2],[4,7]])).toEqual([[1,2],[3,7]]);
  });

  it('all merge into one', () => {
    expect(merge([[1,10],[2,3],[4,5],[6,7]])).toEqual([[1,10]]);
  });

  it('same start different end', () => {
    expect(merge([[1,4],[1,5]])).toEqual([[1,5]]);
  });

  it('negative numbers', () => {
    expect(merge([[-5,-1],[0,2],[3,5]])).toEqual([[-5,-1],[0,2],[3,5]]);
  });

  it('stress: many intervals', () => {
    const intervals: [number, number][] = Array.from({ length: 1000 }, (_, i) => [i * 2, i * 2 + 2]);
    const result = merge(intervals);
    expect(result).toEqual([[0, 2000]]);
  });
});

describe('Insert Interval', () => {
  it('insert into middle with merge', () => {
    expect(insertInterval([[1,3],[6,9]], [2,5])).toEqual([[1,5],[6,9]]);
  });

  it('insert spanning multiple', () => {
    expect(insertInterval([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
      .toEqual([[1,2],[3,10],[12,16]]);
  });

  it('insert at beginning', () => {
    expect(insertInterval([[3,5],[8,10]], [1,2])).toEqual([[1,2],[3,5],[8,10]]);
  });

  it('insert at end', () => {
    expect(insertInterval([[1,3],[5,7]], [9,11])).toEqual([[1,3],[5,7],[9,11]]);
  });

  it('insert into empty list', () => {
    expect(insertInterval([], [2,5])).toEqual([[2,5]]);
  });

  it('insert merging all', () => {
    expect(insertInterval([[1,3],[5,7],[9,11]], [0,12])).toEqual([[0,12]]);
  });

  it('no overlap - insert between', () => {
    expect(insertInterval([[1,2],[5,6]], [3,4])).toEqual([[1,2],[3,4],[5,6]]);
  });

  it('adjacent merge on insert', () => {
    expect(insertInterval([[1,3],[6,8]], [3,6])).toEqual([[1,8]]);
  });
});
]==],
  },

  {
    name = "JSON Parser",
    difficulty = "hard",
    stub = [==[
/**
 * JSON Parser
 *
 * Implement a JSON parser from scratch.
 *
 * parseJSON(input: string): any
 * - Parses a JSON string and returns the corresponding JavaScript value.
 * - Must handle: null, booleans, numbers (integers, decimals, negatives, exponents),
 *   strings (with escape sequences: \", \\, \/, \b, \f, \n, \r, \t, \uXXXX),
 *   arrays, and nested objects.
 * - Throw SyntaxError for invalid JSON with a helpful message.
 *
 * Do NOT use JSON.parse or eval.
 *
 * Bonus: Implement a stringify function that converts a JS value back to
 * a JSON string (handle the same types).
 */

export function parseJSON(input: string): any {
  // YOUR CODE HERE
  throw new SyntaxError('Not implemented');
}

export function stringifyJSON(value: any): string {
  // YOUR CODE HERE
  return '';
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { parseJSON, stringifyJSON } from './challenge';

describe('JSON Parser', () => {
  it('parses null', () => {
    expect(parseJSON('null')).toBe(null);
  });

  it('parses booleans', () => {
    expect(parseJSON('true')).toBe(true);
    expect(parseJSON('false')).toBe(false);
  });

  it('parses integers', () => {
    expect(parseJSON('42')).toBe(42);
    expect(parseJSON('0')).toBe(0);
    expect(parseJSON('-7')).toBe(-7);
  });

  it('parses decimals', () => {
    expect(parseJSON('3.14')).toBeCloseTo(3.14);
    expect(parseJSON('-0.5')).toBeCloseTo(-0.5);
  });

  it('parses exponents', () => {
    expect(parseJSON('1e10')).toBe(1e10);
    expect(parseJSON('2.5E-3')).toBeCloseTo(0.0025);
    expect(parseJSON('-1e+2')).toBe(-100);
  });

  it('parses simple strings', () => {
    expect(parseJSON('"hello"')).toBe('hello');
    expect(parseJSON('""')).toBe('');
  });

  it('parses string escape sequences', () => {
    expect(parseJSON('"line1\\nline2"')).toBe('line1\nline2');
    expect(parseJSON('"tab\\there"')).toBe('tab\there');
    expect(parseJSON('"quote\\"inside"')).toBe('quote"inside');
    expect(parseJSON('"back\\\\slash"')).toBe('back\\slash');
  });

  it('parses unicode escapes', () => {
    expect(parseJSON('"\\u0041"')).toBe('A');
    expect(parseJSON('"\\u00e9"')).toBe('\u00e9');
  });

  it('parses empty array', () => {
    expect(parseJSON('[]')).toEqual([]);
  });

  it('parses array of primitives', () => {
    expect(parseJSON('[1, "two", true, null]')).toEqual([1, 'two', true, null]);
  });

  it('parses nested arrays', () => {
    expect(parseJSON('[[1, 2], [3, [4, 5]]]')).toEqual([[1, 2], [3, [4, 5]]]);
  });

  it('parses empty object', () => {
    expect(parseJSON('{}')).toEqual({});
  });

  it('parses simple object', () => {
    expect(parseJSON('{"a": 1, "b": "hello"}')).toEqual({ a: 1, b: 'hello' });
  });

  it('parses nested objects', () => {
    const input = '{"user": {"name": "Alice", "scores": [10, 20]}}';
    expect(parseJSON(input)).toEqual({ user: { name: 'Alice', scores: [10, 20] } });
  });

  it('handles whitespace', () => {
    expect(parseJSON('  { "a" : 1 , "b" : [ 2 , 3 ] }  ')).toEqual({ a: 1, b: [2, 3] });
  });

  it('throws on invalid JSON - trailing comma', () => {
    expect(() => parseJSON('[1, 2,]')).toThrow(SyntaxError);
  });

  it('throws on invalid JSON - single quotes', () => {
    expect(() => parseJSON("'hello'")).toThrow(SyntaxError);
  });

  it('throws on invalid JSON - undefined', () => {
    expect(() => parseJSON('undefined')).toThrow(SyntaxError);
  });

  it('throws on invalid JSON - missing colon', () => {
    expect(() => parseJSON('{"a" 1}')).toThrow(SyntaxError);
  });

  it('throws on empty input', () => {
    expect(() => parseJSON('')).toThrow(SyntaxError);
  });

  it('stress: deeply nested structure', () => {
    const deep = '{"a":{"b":{"c":{"d":{"e":42}}}}}';
    expect(parseJSON(deep)).toEqual({ a: { b: { c: { d: { e: 42 } } } } });
  });

  it('stress: large array', () => {
    const arr = '[' + Array.from({ length: 500 }, (_, i) => i).join(',') + ']';
    const result = parseJSON(arr);
    expect(result.length).toBe(500);
    expect(result[0]).toBe(0);
    expect(result[499]).toBe(499);
  });
});

describe('Stringify JSON', () => {
  it('stringifies null', () => {
    expect(stringifyJSON(null)).toBe('null');
  });

  it('stringifies booleans', () => {
    expect(stringifyJSON(true)).toBe('true');
    expect(stringifyJSON(false)).toBe('false');
  });

  it('stringifies numbers', () => {
    expect(stringifyJSON(42)).toBe('42');
    expect(stringifyJSON(3.14)).toBe('3.14');
  });

  it('stringifies strings with escapes', () => {
    expect(stringifyJSON('hello')).toBe('"hello"');
    expect(stringifyJSON('line\nnew')).toBe('"line\\nnew"');
    expect(stringifyJSON('quote"here')).toBe('"quote\\"here"');
  });

  it('stringifies arrays', () => {
    expect(stringifyJSON([1, 'a', true])).toBe('[1,"a",true]');
  });

  it('stringifies objects', () => {
    const result = stringifyJSON({ a: 1, b: 'two' });
    expect(parseJSON(result)).toEqual({ a: 1, b: 'two' });
  });

  it('stringifies nested structures', () => {
    const obj = { arr: [1, { nested: true }], val: null };
    const result = stringifyJSON(obj);
    expect(parseJSON(result)).toEqual(obj);
  });

  it('roundtrip: parse(stringify(x)) === x', () => {
    const original = { users: [{ name: 'Bob', age: 30 }], count: 1, active: true };
    expect(parseJSON(stringifyJSON(original))).toEqual(original);
  });
});
]==],
  },

  {
    name = "Linked List Operations",
    difficulty = "easy",
    stub = [==[
/**
 * Linked List Operations
 *
 * Implement a singly linked list and common operations on it.
 *
 * ListNode: { val: number, next: ListNode | null }
 *
 * Implement:
 * - fromArray(arr) — Build a linked list from an array, return the head
 * - toArray(head) — Convert a linked list back to an array
 * - reverse(head) — Reverse the list in-place, return the new head
 * - findMiddle(head) — Return the middle node (for even length, the second middle)
 * - hasCycle(head) — Return true if the list has a cycle (Floyd's algorithm)
 * - mergeSorted(l1, l2) — Merge two sorted lists into one sorted list
 */

export class ListNode {
  val: number;
  next: ListNode | null;
  constructor(val: number, next: ListNode | null = null) {
    this.val = val;
    this.next = next;
  }
}

export function fromArray(arr: number[]): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function toArray(head: ListNode | null): number[] {
  // YOUR CODE HERE
  return [];
}

export function reverse(head: ListNode | null): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function findMiddle(head: ListNode | null): ListNode | null {
  // YOUR CODE HERE
  return null;
}

export function hasCycle(head: ListNode | null): boolean {
  // YOUR CODE HERE
  return false;
}

export function mergeSorted(
  l1: ListNode | null,
  l2: ListNode | null
): ListNode | null {
  // YOUR CODE HERE
  return null;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { ListNode, fromArray, toArray, reverse, findMiddle, hasCycle, mergeSorted } from './challenge';

describe('fromArray & toArray', () => {
  it('round-trips an array', () => {
    expect(toArray(fromArray([1, 2, 3]))).toEqual([1, 2, 3]);
  });

  it('empty array returns null', () => {
    expect(fromArray([])).toBe(null);
  });

  it('null head returns empty array', () => {
    expect(toArray(null)).toEqual([]);
  });

  it('single element', () => {
    expect(toArray(fromArray([42]))).toEqual([42]);
  });
});

describe('reverse', () => {
  it('reverses a list', () => {
    expect(toArray(reverse(fromArray([1, 2, 3, 4])))).toEqual([4, 3, 2, 1]);
  });

  it('single node stays the same', () => {
    expect(toArray(reverse(fromArray([7])))).toEqual([7]);
  });

  it('null returns null', () => {
    expect(reverse(null)).toBe(null);
  });

  it('two elements', () => {
    expect(toArray(reverse(fromArray([1, 2])))).toEqual([2, 1]);
  });
});

describe('findMiddle', () => {
  it('odd-length list', () => {
    expect(findMiddle(fromArray([1, 2, 3, 4, 5]))!.val).toBe(3);
  });

  it('even-length list returns second middle', () => {
    expect(findMiddle(fromArray([1, 2, 3, 4]))!.val).toBe(3);
  });

  it('single element', () => {
    expect(findMiddle(fromArray([10]))!.val).toBe(10);
  });

  it('null returns null', () => {
    expect(findMiddle(null)).toBe(null);
  });

  it('two elements returns second', () => {
    expect(findMiddle(fromArray([1, 2]))!.val).toBe(2);
  });
});

describe('hasCycle', () => {
  it('no cycle', () => {
    expect(hasCycle(fromArray([1, 2, 3]))).toBe(false);
  });

  it('detects cycle', () => {
    const a = new ListNode(1);
    const b = new ListNode(2);
    const c = new ListNode(3);
    a.next = b;
    b.next = c;
    c.next = a;
    expect(hasCycle(a)).toBe(true);
  });

  it('self-loop', () => {
    const a = new ListNode(1);
    a.next = a;
    expect(hasCycle(a)).toBe(true);
  });

  it('null is not a cycle', () => {
    expect(hasCycle(null)).toBe(false);
  });

  it('cycle in the middle', () => {
    const a = new ListNode(1);
    const b = new ListNode(2);
    const c = new ListNode(3);
    const d = new ListNode(4);
    a.next = b;
    b.next = c;
    c.next = d;
    d.next = b;
    expect(hasCycle(a)).toBe(true);
  });
});

describe('mergeSorted', () => {
  it('merges two sorted lists', () => {
    const l1 = fromArray([1, 3, 5]);
    const l2 = fromArray([2, 4, 6]);
    expect(toArray(mergeSorted(l1, l2))).toEqual([1, 2, 3, 4, 5, 6]);
  });

  it('one list is empty', () => {
    expect(toArray(mergeSorted(fromArray([1, 2]), null))).toEqual([1, 2]);
    expect(toArray(mergeSorted(null, fromArray([3, 4])))).toEqual([3, 4]);
  });

  it('both empty', () => {
    expect(mergeSorted(null, null)).toBe(null);
  });

  it('different lengths', () => {
    const l1 = fromArray([1]);
    const l2 = fromArray([2, 3, 4, 5]);
    expect(toArray(mergeSorted(l1, l2))).toEqual([1, 2, 3, 4, 5]);
  });

  it('duplicates', () => {
    const l1 = fromArray([1, 3, 3]);
    const l2 = fromArray([1, 2, 3]);
    expect(toArray(mergeSorted(l1, l2))).toEqual([1, 1, 2, 3, 3, 3]);
  });

  it('stress: large merge', () => {
    const a = Array.from({ length: 500 }, (_, i) => i * 2);
    const b = Array.from({ length: 500 }, (_, i) => i * 2 + 1);
    const result = toArray(mergeSorted(fromArray(a), fromArray(b)));
    expect(result).toEqual(Array.from({ length: 1000 }, (_, i) => i));
  });
});
]==],
  },

  {
    name = "Throttle Function",
    difficulty = "medium",
    stub = [==[
/**
 * Throttle Function
 *
 * Implement a throttle function that limits how often the provided function
 * can be called. Unlike debounce (which waits for silence), throttle ensures
 * the function fires at most once per `interval` milliseconds.
 *
 * Requirements:
 * - The first call fires immediately (leading edge)
 * - Subsequent calls within the interval are ignored
 * - If called during the interval, the LAST call fires when the interval ends (trailing edge)
 * - The throttled function has cancel() and flush() methods
 *
 * Options (bonus):
 * - leading: boolean (default true) — fire on the leading edge
 * - trailing: boolean (default true) — fire on the trailing edge
 */

type AnyFunction = (...args: any[]) => any;

interface ThrottleOptions {
  leading?: boolean;
  trailing?: boolean;
}

interface ThrottledFunction<T extends AnyFunction> {
  (...args: Parameters<T>): void;
  cancel(): void;
  flush(): void;
}

export function throttle<T extends AnyFunction>(
  fn: T,
  interval: number,
  options?: ThrottleOptions
): ThrottledFunction<T> {
  // YOUR CODE HERE
  const noop = (() => {}) as any;
  noop.cancel = () => {};
  noop.flush = () => {};
  return noop;
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { throttle } from './challenge';

describe('Throttle', () => {
  beforeEach(() => { vi.useFakeTimers(); });
  afterEach(() => { vi.restoreAllTimers(); });

  it('fires immediately on first call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    expect(fn).toHaveBeenCalledOnce();
  });

  it('ignores calls within the interval', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledOnce();
  });

  it('fires trailing call after interval', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1);
    throttled(2);
    throttled(3);
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
    expect(fn).toHaveBeenLastCalledWith(3);
  });

  it('allows new call after interval passes', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    vi.advanceTimersByTime(100);
    throttled();
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('passes latest arguments to trailing call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled('a');
    throttled('b');
    throttled('c');
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenLastCalledWith('c');
  });

  it('cancel prevents trailing call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1);
    throttled(2);
    throttled.cancel();
    vi.advanceTimersByTime(200);
    expect(fn).toHaveBeenCalledOnce();
    expect(fn).toHaveBeenCalledWith(1);
  });

  it('flush immediately fires pending trailing call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1);
    throttled(2);
    throttled.flush();
    expect(fn).toHaveBeenCalledTimes(2);
    expect(fn).toHaveBeenLastCalledWith(2);
  });

  it('flush does nothing if no pending call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled.flush();
    expect(fn).not.toHaveBeenCalled();
  });

  it('leading: false skips immediate call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100, { leading: false });
    throttled(1);
    expect(fn).not.toHaveBeenCalled();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledOnce();
    expect(fn).toHaveBeenCalledWith(1);
  });

  it('trailing: false skips trailing call', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100, { trailing: false });
    throttled(1);
    throttled(2);
    throttled(3);
    vi.advanceTimersByTime(200);
    expect(fn).toHaveBeenCalledOnce();
    expect(fn).toHaveBeenCalledWith(1);
  });

  it('repeated calls over multiple intervals', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1);
    vi.advanceTimersByTime(50);
    throttled(2);
    vi.advanceTimersByTime(50);
    // interval passed: trailing fires with 2
    throttled(3);
    vi.advanceTimersByTime(50);
    throttled(4);
    vi.advanceTimersByTime(50);
    // interval passed: trailing fires with 4
    expect(fn).toHaveBeenCalledTimes(4);
  });

  it('stress: many rapid calls', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 50);
    for (let i = 0; i < 200; i++) {
      throttled(i);
      vi.advanceTimersByTime(1);
    }
    vi.advanceTimersByTime(50);
    // Should fire way fewer than 200 times
    expect(fn.mock.calls.length).toBeLessThan(20);
    expect(fn.mock.calls.length).toBeGreaterThan(2);
  });
});
]==],
  },

  {
    name = "Middleware Chain",
    difficulty = "medium",
    stub = [==[
/**
 * Middleware Chain
 *
 * Implement an Express/Koa-style middleware pipeline.
 *
 * A middleware is a function (ctx, next) => void | Promise<void>
 * - `ctx` is a shared context object that middlewares can read/write
 * - `next()` calls the next middleware in the chain and returns a Promise
 * - If a middleware doesn't call next(), the chain stops
 * - Middlewares can run code BEFORE and AFTER next() (like Koa's onion model)
 * - Calling next() more than once should throw an Error
 *
 * Pipeline class:
 * - use(middleware) -- Add a middleware to the chain. Returns `this` for chaining.
 * - execute(ctx) -- Run all middlewares on the context. Returns Promise<void>.
 *
 * Example:
 *   const app = new Pipeline();
 *   app.use(async (ctx, next) => {
 *     ctx.logs.push('A-before');
 *     await next();
 *     ctx.logs.push('A-after');
 *   });
 *   app.use(async (ctx, next) => {
 *     ctx.logs.push('B');
 *     await next();
 *   });
 *   const ctx = { logs: [] };
 *   await app.execute(ctx);
 *   // ctx.logs => ['A-before', 'B', 'A-after']
 */

export type Context = Record<string, any>;
export type Next = () => Promise<void>;
export type Middleware = (ctx: Context, next: Next) => void | Promise<void>;

export class Pipeline {
  use(middleware: Middleware): this {
    // YOUR CODE HERE
    return this;
  }

  execute(ctx: Context): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { Pipeline } from './challenge';

describe('Middleware Chain', () => {
  it('runs a single middleware', async () => {
    const app = new Pipeline();
    const ctx: any = { value: 0 };
    app.use(async (ctx, next) => {
      ctx.value = 1;
      await next();
    });
    await app.execute(ctx);
    expect(ctx.value).toBe(1);
  });

  it('runs middlewares in order', async () => {
    const app = new Pipeline();
    const ctx: any = { logs: [] };
    app.use(async (ctx, next) => { ctx.logs.push(1); await next(); });
    app.use(async (ctx, next) => { ctx.logs.push(2); await next(); });
    app.use(async (ctx, next) => { ctx.logs.push(3); await next(); });
    await app.execute(ctx);
    expect(ctx.logs).toEqual([1, 2, 3]);
  });

  it('supports the onion model (before and after next)', async () => {
    const app = new Pipeline();
    const ctx: any = { logs: [] };
    app.use(async (ctx, next) => {
      ctx.logs.push('A-before');
      await next();
      ctx.logs.push('A-after');
    });
    app.use(async (ctx, next) => {
      ctx.logs.push('B-before');
      await next();
      ctx.logs.push('B-after');
    });
    app.use(async (ctx, next) => {
      ctx.logs.push('C');
      await next();
    });
    await app.execute(ctx);
    expect(ctx.logs).toEqual(['A-before', 'B-before', 'C', 'B-after', 'A-after']);
  });

  it('stops chain if next is not called', async () => {
    const app = new Pipeline();
    const ctx: any = { logs: [] };
    app.use(async (ctx) => { ctx.logs.push('guard'); });
    app.use(async (ctx, next) => { ctx.logs.push('unreachable'); await next(); });
    await app.execute(ctx);
    expect(ctx.logs).toEqual(['guard']);
  });

  it('throws if next() called multiple times', async () => {
    const app = new Pipeline();
    app.use(async (ctx, next) => {
      await next();
      await next();
    });
    await expect(app.execute({})).rejects.toThrow();
  });

  it('propagates errors from middleware', async () => {
    const app = new Pipeline();
    app.use(async () => { throw new Error('boom'); });
    await expect(app.execute({})).rejects.toThrow('boom');
  });

  it('downstream error caught by upstream middleware', async () => {
    const app = new Pipeline();
    const ctx: any = { error: null };
    app.use(async (ctx, next) => {
      try { await next(); } catch (e: any) { ctx.error = e.message; }
    });
    app.use(async () => { throw new Error('downstream fail'); });
    await app.execute(ctx);
    expect(ctx.error).toBe('downstream fail');
  });

  it('use() is chainable', () => {
    const app = new Pipeline();
    const result = app
      .use(async (ctx, next) => { await next(); })
      .use(async (ctx, next) => { await next(); });
    expect(result).toBe(app);
  });

  it('empty pipeline does nothing', async () => {
    const app = new Pipeline();
    const ctx = { value: 42 };
    await app.execute(ctx);
    expect(ctx.value).toBe(42);
  });

  it('ctx is shared across all middlewares', async () => {
    const app = new Pipeline();
    app.use(async (ctx, next) => { ctx.user = 'alice'; await next(); });
    app.use(async (ctx, next) => { ctx.greeting = `hi ${ctx.user}`; await next(); });
    const ctx: any = {};
    await app.execute(ctx);
    expect(ctx.greeting).toBe('hi alice');
  });

  it('async middlewares run sequentially', async () => {
    const app = new Pipeline();
    const ctx: any = { logs: [] };
    app.use(async (ctx, next) => {
      await new Promise(r => setTimeout(r, 30));
      ctx.logs.push('slow');
      await next();
    });
    app.use(async (ctx, next) => {
      ctx.logs.push('fast');
      await next();
    });
    await app.execute(ctx);
    expect(ctx.logs).toEqual(['slow', 'fast']);
  });

  it('stress: many middlewares', async () => {
    const app = new Pipeline();
    const ctx: any = { count: 0 };
    for (let i = 0; i < 200; i++) {
      app.use(async (ctx, next) => { ctx.count++; await next(); });
    }
    await app.execute(ctx);
    expect(ctx.count).toBe(200);
  });

  it('timing middleware pattern', async () => {
    const app = new Pipeline();
    const ctx: any = {};
    app.use(async (ctx, next) => {
      const start = Date.now();
      await next();
      ctx.duration = Date.now() - start;
    });
    app.use(async (ctx, next) => {
      await new Promise(r => setTimeout(r, 20));
      await next();
    });
    await app.execute(ctx);
    expect(ctx.duration).toBeGreaterThanOrEqual(15);
  });
});
]==],
  },

  {
    name = "Min Stack",
    difficulty = "easy",
    stub = [==[
/**
 * Min Stack
 *
 * Design a stack that supports push, pop, top, and retrieving the minimum
 * element — all in O(1) time.
 *
 * Implement the MinStack class:
 * - push(val: number): void — Push val onto the stack
 * - pop(): number | undefined — Remove and return the top element
 * - top(): number | undefined — Return the top element without removing it
 * - getMin(): number | undefined — Retrieve the minimum element in the stack
 *
 * Constraint: Every operation must be O(1).
 *
 * Bonus: Implement a MaxStack with the same guarantees plus peekMax() and popMax().
 */

export class MinStack {
  constructor() {
    // YOUR CODE HERE
  }

  push(val: number): void {
    // YOUR CODE HERE
  }

  pop(): number | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  top(): number | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  getMin(): number | undefined {
    // YOUR CODE HERE
    return undefined;
  }

  get size(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { MinStack } from './challenge';

describe('Min Stack', () => {
  it('push and top', () => {
    const s = new MinStack();
    s.push(5);
    expect(s.top()).toBe(5);
    s.push(3);
    expect(s.top()).toBe(3);
  });

  it('pop returns top element', () => {
    const s = new MinStack();
    s.push(1);
    s.push(2);
    expect(s.pop()).toBe(2);
    expect(s.top()).toBe(1);
  });

  it('getMin returns minimum', () => {
    const s = new MinStack();
    s.push(5);
    s.push(2);
    s.push(8);
    expect(s.getMin()).toBe(2);
  });

  it('getMin updates after pop', () => {
    const s = new MinStack();
    s.push(3);
    s.push(1);
    s.push(5);
    expect(s.getMin()).toBe(1);
    s.pop();
    expect(s.getMin()).toBe(1);
    s.pop();
    expect(s.getMin()).toBe(3);
  });

  it('empty stack returns undefined', () => {
    const s = new MinStack();
    expect(s.top()).toBe(undefined);
    expect(s.pop()).toBe(undefined);
    expect(s.getMin()).toBe(undefined);
  });

  it('size tracks correctly', () => {
    const s = new MinStack();
    expect(s.size).toBe(0);
    s.push(1);
    s.push(2);
    expect(s.size).toBe(2);
    s.pop();
    expect(s.size).toBe(1);
  });

  it('duplicate minimums', () => {
    const s = new MinStack();
    s.push(2);
    s.push(2);
    s.push(2);
    expect(s.getMin()).toBe(2);
    s.pop();
    expect(s.getMin()).toBe(2);
    s.pop();
    expect(s.getMin()).toBe(2);
  });

  it('decreasing then increasing sequence', () => {
    const s = new MinStack();
    s.push(5);
    s.push(4);
    s.push(3);
    s.push(6);
    s.push(7);
    expect(s.getMin()).toBe(3);
    s.pop();
    s.pop();
    expect(s.getMin()).toBe(3);
    s.pop();
    expect(s.getMin()).toBe(4);
  });

  it('negative numbers', () => {
    const s = new MinStack();
    s.push(-1);
    s.push(-5);
    s.push(-3);
    expect(s.getMin()).toBe(-5);
    s.pop();
    expect(s.getMin()).toBe(-5);
    s.pop();
    expect(s.getMin()).toBe(-1);
  });

  it('single element push and pop', () => {
    const s = new MinStack();
    s.push(42);
    expect(s.getMin()).toBe(42);
    expect(s.pop()).toBe(42);
    expect(s.getMin()).toBe(undefined);
  });

  it('stress: many operations', () => {
    const s = new MinStack();
    for (let i = 1000; i >= 0; i--) {
      s.push(i);
    }
    expect(s.getMin()).toBe(0);
    expect(s.size).toBe(1001);
    for (let i = 0; i <= 500; i++) {
      s.pop();
    }
    expect(s.getMin()).toBe(501);
    expect(s.size).toBe(500);
  });

  it('interleaved push and pop with min tracking', () => {
    const s = new MinStack();
    s.push(10);
    s.push(1);
    expect(s.getMin()).toBe(1);
    s.pop();
    s.push(5);
    expect(s.getMin()).toBe(5);
    s.push(0);
    expect(s.getMin()).toBe(0);
    s.pop();
    expect(s.getMin()).toBe(5);
  });
});
]==],
  },

  {
    name = "Undo/Redo Stack",
    difficulty = "medium",
    stub = [==[
/**
 * Undo/Redo Stack (Command Pattern)
 *
 * Implement a generic undo/redo system using the Command pattern.
 *
 * Command interface:
 *   { execute(): void, undo(): void }
 *
 * UndoRedoManager class:
 * - execute(command) -- Execute a command and push it onto the undo stack.
 *   Clears the redo stack (new action invalidates future history).
 * - undo() -- Undo the most recent command. Returns true if something was undone.
 * - redo() -- Redo the most recently undone command. Returns true if something was redone.
 * - canUndo -- boolean, whether there's anything to undo
 * - canRedo -- boolean, whether there's anything to redo
 * - history -- readonly array of executed command descriptions
 *
 * Bonus: Implement a TextEditor class that uses UndoRedoManager internally:
 * - type(text) -- Insert text at the cursor position
 * - delete(count) -- Delete `count` characters before the cursor
 * - moveCursor(position) -- Move cursor to an absolute position
 * - getText() -- Return current text content
 * - getCursor() -- Return current cursor position
 * - undo() / redo() -- Delegate to the manager
 */

export interface Command {
  execute(): void;
  undo(): void;
  description: string;
}

export class UndoRedoManager {
  constructor() {
    // YOUR CODE HERE
  }

  execute(command: Command): void {
    // YOUR CODE HERE
  }

  undo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  redo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  get canUndo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  get canRedo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  get history(): string[] {
    // YOUR CODE HERE
    return [];
  }
}

export class TextEditor {
  constructor() {
    // YOUR CODE HERE
  }

  type(text: string): void {
    // YOUR CODE HERE
  }

  delete(count: number): void {
    // YOUR CODE HERE
  }

  moveCursor(position: number): void {
    // YOUR CODE HERE
  }

  getText(): string {
    // YOUR CODE HERE
    return '';
  }

  getCursor(): number {
    // YOUR CODE HERE
    return 0;
  }

  undo(): boolean {
    // YOUR CODE HERE
    return false;
  }

  redo(): boolean {
    // YOUR CODE HERE
    return false;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { UndoRedoManager, Command, TextEditor } from './challenge';

describe('UndoRedoManager', () => {
  it('executes a command', () => {
    const mgr = new UndoRedoManager();
    let value = 0;
    mgr.execute({
      execute() { value = 10; },
      undo() { value = 0; },
      description: 'set to 10',
    });
    expect(value).toBe(10);
  });

  it('undoes a command', () => {
    const mgr = new UndoRedoManager();
    let value = 0;
    mgr.execute({
      execute() { value = 5; },
      undo() { value = 0; },
      description: 'set to 5',
    });
    expect(mgr.undo()).toBe(true);
    expect(value).toBe(0);
  });

  it('redoes an undone command', () => {
    const mgr = new UndoRedoManager();
    let value = 0;
    mgr.execute({
      execute() { value = 42; },
      undo() { value = 0; },
      description: 'set to 42',
    });
    mgr.undo();
    expect(mgr.redo()).toBe(true);
    expect(value).toBe(42);
  });

  it('undo returns false when nothing to undo', () => {
    const mgr = new UndoRedoManager();
    expect(mgr.undo()).toBe(false);
  });

  it('redo returns false when nothing to redo', () => {
    const mgr = new UndoRedoManager();
    expect(mgr.redo()).toBe(false);
  });

  it('new execute clears redo stack', () => {
    const mgr = new UndoRedoManager();
    let value = 0;
    mgr.execute({ execute() { value = 1; }, undo() { value = 0; }, description: 'a' });
    mgr.execute({ execute() { value = 2; }, undo() { value = 1; }, description: 'b' });
    mgr.undo();
    expect(value).toBe(1);
    mgr.execute({ execute() { value = 3; }, undo() { value = 1; }, description: 'c' });
    expect(mgr.canRedo).toBe(false);
    expect(mgr.redo()).toBe(false);
  });

  it('canUndo and canRedo reflect state', () => {
    const mgr = new UndoRedoManager();
    expect(mgr.canUndo).toBe(false);
    expect(mgr.canRedo).toBe(false);
    mgr.execute({ execute() {}, undo() {}, description: 'x' });
    expect(mgr.canUndo).toBe(true);
    mgr.undo();
    expect(mgr.canUndo).toBe(false);
    expect(mgr.canRedo).toBe(true);
  });

  it('history tracks executed commands', () => {
    const mgr = new UndoRedoManager();
    mgr.execute({ execute() {}, undo() {}, description: 'first' });
    mgr.execute({ execute() {}, undo() {}, description: 'second' });
    expect(mgr.history).toEqual(['first', 'second']);
  });

  it('history updates on undo', () => {
    const mgr = new UndoRedoManager();
    mgr.execute({ execute() {}, undo() {}, description: 'a' });
    mgr.execute({ execute() {}, undo() {}, description: 'b' });
    mgr.undo();
    expect(mgr.history).toEqual(['a']);
  });

  it('multiple undo/redo cycles', () => {
    const mgr = new UndoRedoManager();
    const log: number[] = [];
    mgr.execute({ execute() { log.push(1); }, undo() { log.push(-1); }, description: '1' });
    mgr.execute({ execute() { log.push(2); }, undo() { log.push(-2); }, description: '2' });
    mgr.execute({ execute() { log.push(3); }, undo() { log.push(-3); }, description: '3' });
    mgr.undo();
    mgr.undo();
    mgr.redo();
    mgr.redo();
    expect(log).toEqual([1, 2, 3, -3, -2, 2, 3]);
  });

  it('stress: many operations', () => {
    const mgr = new UndoRedoManager();
    let counter = 0;
    for (let i = 0; i < 100; i++) {
      const prev = counter;
      mgr.execute({
        execute() { counter++; },
        undo() { counter = prev; },
        description: `inc ${i}`,
      });
    }
    expect(counter).toBe(100);
    for (let i = 0; i < 50; i++) mgr.undo();
    expect(counter).toBe(50);
    for (let i = 0; i < 25; i++) mgr.redo();
    expect(counter).toBe(75);
  });
});

describe('TextEditor', () => {
  it('type inserts text', () => {
    const editor = new TextEditor();
    editor.type('hello');
    expect(editor.getText()).toBe('hello');
    expect(editor.getCursor()).toBe(5);
  });

  it('type at cursor position', () => {
    const editor = new TextEditor();
    editor.type('hello');
    editor.moveCursor(0);
    editor.type('say ');
    expect(editor.getText()).toBe('say hello');
    expect(editor.getCursor()).toBe(4);
  });

  it('delete removes characters before cursor', () => {
    const editor = new TextEditor();
    editor.type('hello world');
    editor.delete(6);
    expect(editor.getText()).toBe('hello');
    expect(editor.getCursor()).toBe(5);
  });

  it('undo type', () => {
    const editor = new TextEditor();
    editor.type('hello');
    editor.undo();
    expect(editor.getText()).toBe('');
    expect(editor.getCursor()).toBe(0);
  });

  it('undo delete', () => {
    const editor = new TextEditor();
    editor.type('hello');
    editor.delete(3);
    expect(editor.getText()).toBe('he');
    editor.undo();
    expect(editor.getText()).toBe('hello');
    expect(editor.getCursor()).toBe(5);
  });

  it('redo after undo', () => {
    const editor = new TextEditor();
    editor.type('abc');
    editor.undo();
    editor.redo();
    expect(editor.getText()).toBe('abc');
  });

  it('complex editing sequence with undo', () => {
    const editor = new TextEditor();
    editor.type('Hello');
    editor.type(' World');
    editor.moveCursor(5);
    editor.type(',');
    expect(editor.getText()).toBe('Hello, World');
    editor.undo();
    expect(editor.getText()).toBe('Hello World');
    editor.undo();
    expect(editor.getText()).toBe('Hello');
  });

  it('delete at position 0 does nothing meaningful', () => {
    const editor = new TextEditor();
    editor.type('abc');
    editor.moveCursor(0);
    editor.delete(5);
    expect(editor.getText()).toBe('abc');
    expect(editor.getCursor()).toBe(0);
  });

  it('moveCursor clamps to valid range', () => {
    const editor = new TextEditor();
    editor.type('hi');
    editor.moveCursor(100);
    expect(editor.getCursor()).toBe(2);
    editor.moveCursor(-5);
    expect(editor.getCursor()).toBe(0);
  });

  it('stress: many type and undo operations', () => {
    const editor = new TextEditor();
    for (let i = 0; i < 50; i++) {
      editor.type(String.fromCharCode(97 + (i % 26)));
    }
    expect(editor.getText().length).toBe(50);
    for (let i = 0; i < 50; i++) {
      editor.undo();
    }
    expect(editor.getText()).toBe('');
  });
});
]==],
  },

  {
    name = "Graph Shortest Path (Dijkstra)",
    difficulty = "hard",
    stub = [==[
/**
 * Graph Shortest Path (Dijkstra's Algorithm)
 *
 * Implement Dijkstra's algorithm to find the shortest path in a weighted directed graph.
 *
 * Graph representation: adjacency list
 *   edges[i] = [[neighbor, weight], ...] for node i
 *
 * Implement:
 * - dijkstra(numNodes, edges, source) -- Returns an array of shortest distances from source
 *   to every node. Use Infinity for unreachable nodes.
 *
 * - shortestPath(numNodes, edges, source, target) -- Returns the actual shortest path
 *   as an array of node indices, or null if target is unreachable.
 *
 * Bonus: Implement a WeightedGraph class with addEdge/removeEdge/shortestPath methods.
 *
 * Constraints:
 * - All edge weights are non-negative
 * - Use a min-heap / priority queue for O((V + E) log V) complexity
 */

export function dijkstra(
  numNodes: number,
  edges: [number, number][][],
  source: number
): number[] {
  // YOUR CODE HERE
  return [];
}

export function shortestPath(
  numNodes: number,
  edges: [number, number][][],
  source: number,
  target: number
): number[] | null {
  // YOUR CODE HERE
  return null;
}

export class WeightedGraph {
  private adjList: Map<number, [number, number][]> = new Map();
  private nodeCount: number;

  constructor(numNodes: number) {
    this.nodeCount = numNodes;
    // YOUR CODE HERE
  }

  addEdge(from: number, to: number, weight: number): void {
    // YOUR CODE HERE
  }

  removeEdge(from: number, to: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  shortestPath(source: number, target: number): { distance: number; path: number[] } | null {
    // YOUR CODE HERE
    return null;
  }

  get size(): number {
    return this.nodeCount;
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { dijkstra, shortestPath, WeightedGraph } from './challenge';

describe('Dijkstra shortest distances', () => {
  it('simple graph', () => {
    //   0 --1--> 1 --2--> 2
    //   |                  ^
    //   +------10----------+
    const edges: [number, number][][] = [
      [[1, 1], [2, 10]],  // 0 -> 1 (w1), 0 -> 2 (w10)
      [[2, 2]],            // 1 -> 2 (w2)
      [],                  // 2
    ];
    const dist = dijkstra(3, edges, 0);
    expect(dist).toEqual([0, 1, 3]);
  });

  it('unreachable nodes get Infinity', () => {
    const edges: [number, number][][] = [
      [[1, 5]],
      [],
      [[0, 1]],
    ];
    const dist = dijkstra(3, edges, 0);
    expect(dist[0]).toBe(0);
    expect(dist[1]).toBe(5);
    expect(dist[2]).toBe(Infinity);
  });

  it('single node', () => {
    expect(dijkstra(1, [[]], 0)).toEqual([0]);
  });

  it('disconnected graph', () => {
    const edges: [number, number][][] = [[], [], []];
    const dist = dijkstra(3, edges, 0);
    expect(dist).toEqual([0, Infinity, Infinity]);
  });

  it('diamond graph picks shorter path', () => {
    //        1
    //   0 --/ \-- 3
    //    \  2  /
    //     \-+-/
    const edges: [number, number][][] = [
      [[1, 1], [2, 5]],  // 0
      [[3, 1]],           // 1
      [[3, 1]],           // 2
      [],                 // 3
    ];
    const dist = dijkstra(4, edges, 0);
    expect(dist[3]).toBe(2);  // 0->1->3
  });

  it('handles zero-weight edges', () => {
    const edges: [number, number][][] = [
      [[1, 0]],
      [[2, 0]],
      [],
    ];
    expect(dijkstra(3, edges, 0)).toEqual([0, 0, 0]);
  });

  it('stress: chain of 1000 nodes', () => {
    const n = 1000;
    const edges: [number, number][][] = Array.from({ length: n }, () => []);
    for (let i = 0; i < n - 1; i++) {
      edges[i].push([i + 1, 1]);
    }
    const dist = dijkstra(n, edges, 0);
    expect(dist[0]).toBe(0);
    expect(dist[n - 1]).toBe(n - 1);
  });

  it('multiple paths with different weights', () => {
    // 0 -> 1 (w4), 0 -> 2 (w1), 2 -> 1 (w2)
    const edges: [number, number][][] = [
      [[1, 4], [2, 1]],
      [],
      [[1, 2]],
    ];
    const dist = dijkstra(3, edges, 0);
    expect(dist[1]).toBe(3);  // 0->2->1
  });
});

describe('shortestPath reconstruction', () => {
  it('returns the path', () => {
    const edges: [number, number][][] = [
      [[1, 1], [2, 10]],
      [[2, 2]],
      [],
    ];
    expect(shortestPath(3, edges, 0, 2)).toEqual([0, 1, 2]);
  });

  it('returns null for unreachable target', () => {
    const edges: [number, number][][] = [[], [[0, 1]]];
    expect(shortestPath(2, edges, 0, 1)).toBe(null);
  });

  it('source equals target', () => {
    const edges: [number, number][][] = [[[1, 1]], []];
    expect(shortestPath(2, edges, 0, 0)).toEqual([0]);
  });

  it('longer path reconstruction', () => {
    const edges: [number, number][][] = [
      [[1, 1]],
      [[2, 1]],
      [[3, 1]],
      [[4, 1]],
      [],
    ];
    expect(shortestPath(5, edges, 0, 4)).toEqual([0, 1, 2, 3, 4]);
  });

  it('chooses shorter path in reconstruction', () => {
    // 0->1 (w10), 0->2 (w1), 2->1 (w1)
    const edges: [number, number][][] = [
      [[1, 10], [2, 1]],
      [],
      [[1, 1]],
    ];
    expect(shortestPath(3, edges, 0, 1)).toEqual([0, 2, 1]);
  });
});

describe('WeightedGraph class', () => {
  it('addEdge and shortestPath', () => {
    const g = new WeightedGraph(3);
    g.addEdge(0, 1, 2);
    g.addEdge(1, 2, 3);
    g.addEdge(0, 2, 10);
    const result = g.shortestPath(0, 2);
    expect(result).not.toBeNull();
    expect(result!.distance).toBe(5);
    expect(result!.path).toEqual([0, 1, 2]);
  });

  it('removeEdge forces longer path', () => {
    const g = new WeightedGraph(3);
    g.addEdge(0, 1, 1);
    g.addEdge(1, 2, 1);
    g.addEdge(0, 2, 10);
    expect(g.shortestPath(0, 2)!.distance).toBe(2);
    g.removeEdge(0, 1);
    expect(g.shortestPath(0, 2)!.distance).toBe(10);
  });

  it('removeEdge returns false for non-existent edge', () => {
    const g = new WeightedGraph(2);
    expect(g.removeEdge(0, 1)).toBe(false);
  });

  it('unreachable target returns null', () => {
    const g = new WeightedGraph(2);
    expect(g.shortestPath(0, 1)).toBeNull();
  });

  it('size returns node count', () => {
    const g = new WeightedGraph(5);
    expect(g.size).toBe(5);
  });
});
]==],
  },

  {
    name = "Finite State Machine",
    difficulty = "medium",
    stub = [==[
/**
 * Finite State Machine
 *
 * Implement a generic finite state machine (FSM) that can model
 * stateful systems like traffic lights, vending machines, or UI flows.
 *
 * StateMachine class:
 * - constructor(config) — Takes a configuration object:
 *   {
 *     initial: string,            // starting state
 *     states: {
 *       [stateName]: {
 *         on: { [event]: string | { target: string, action?: (ctx) => void } }
 *         enter?: (ctx) => void,  // called when entering this state
 *         exit?: (ctx) => void,   // called when leaving this state
 *       }
 *     }
 *   }
 *
 * - send(event: string) — Trigger a transition. Returns the new state.
 *   If the event is not defined for the current state, stay in the current state.
 * - get state — Current state name
 * - get context — Shared context object (starts as {})
 * - matches(state: string) — Returns true if current state equals the given state
 * - onTransition(callback) — Register a listener called on every transition
 *   with { from, to, event }. Returns an unsubscribe function.
 *
 * Bonus: Add guard conditions — transitions only happen if guard(ctx) returns true.
 *   on: { EVENT: { target: 'next', guard: (ctx) => ctx.count > 0 } }
 */

type ActionFn = (ctx: Record<string, any>) => void;
type GuardFn = (ctx: Record<string, any>) => boolean;

interface TransitionTarget {
  target: string;
  action?: ActionFn;
  guard?: GuardFn;
}

interface StateConfig {
  on?: Record<string, string | TransitionTarget>;
  enter?: ActionFn;
  exit?: ActionFn;
}

interface MachineConfig {
  initial: string;
  states: Record<string, StateConfig>;
}

interface TransitionInfo {
  from: string;
  to: string;
  event: string;
}

export class StateMachine {
  constructor(config: MachineConfig) {
    // YOUR CODE HERE
  }

  send(event: string): string {
    // YOUR CODE HERE
    return '';
  }

  get state(): string {
    // YOUR CODE HERE
    return '';
  }

  get context(): Record<string, any> {
    // YOUR CODE HERE
    return {};
  }

  matches(state: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  onTransition(callback: (info: TransitionInfo) => void): () => void {
    // YOUR CODE HERE
    return () => {};
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { StateMachine } from './challenge';

describe('Finite State Machine', () => {
  const trafficLight = () => new StateMachine({
    initial: 'green',
    states: {
      green: { on: { TIMER: 'yellow' } },
      yellow: { on: { TIMER: 'red' } },
      red: { on: { TIMER: 'green' } },
    },
  });

  it('starts in initial state', () => {
    const machine = trafficLight();
    expect(machine.state).toBe('green');
  });

  it('transitions on event', () => {
    const machine = trafficLight();
    expect(machine.send('TIMER')).toBe('yellow');
    expect(machine.state).toBe('yellow');
  });

  it('follows full cycle', () => {
    const machine = trafficLight();
    machine.send('TIMER');
    machine.send('TIMER');
    machine.send('TIMER');
    expect(machine.state).toBe('green');
  });

  it('ignores undefined events', () => {
    const machine = trafficLight();
    machine.send('UNKNOWN');
    expect(machine.state).toBe('green');
  });

  it('matches checks current state', () => {
    const machine = trafficLight();
    expect(machine.matches('green')).toBe(true);
    expect(machine.matches('red')).toBe(false);
  });

  it('calls enter/exit hooks', () => {
    const enterFn = vi.fn();
    const exitFn = vi.fn();
    const machine = new StateMachine({
      initial: 'idle',
      states: {
        idle: {
          on: { START: 'running' },
          exit: exitFn,
        },
        running: {
          on: { STOP: 'idle' },
          enter: enterFn,
        },
      },
    });
    machine.send('START');
    expect(exitFn).toHaveBeenCalledOnce();
    expect(enterFn).toHaveBeenCalledOnce();
  });

  it('enter hook receives context', () => {
    const machine = new StateMachine({
      initial: 'a',
      states: {
        a: { on: { GO: { target: 'b', action: (ctx) => { ctx.count = 1; } } } },
        b: { enter: (ctx) => { ctx.entered = true; } },
      },
    });
    machine.send('GO');
    expect(machine.context.count).toBe(1);
    expect(machine.context.entered).toBe(true);
  });

  it('action runs on transition', () => {
    const machine = new StateMachine({
      initial: 'off',
      states: {
        off: { on: { TOGGLE: { target: 'on', action: (ctx) => { ctx.toggles = (ctx.toggles || 0) + 1; } } } },
        on: { on: { TOGGLE: { target: 'off', action: (ctx) => { ctx.toggles = (ctx.toggles || 0) + 1; } } } },
      },
    });
    machine.send('TOGGLE');
    machine.send('TOGGLE');
    machine.send('TOGGLE');
    expect(machine.context.toggles).toBe(3);
    expect(machine.state).toBe('on');
  });

  it('onTransition callback fires', () => {
    const machine = trafficLight();
    const cb = vi.fn();
    machine.onTransition(cb);
    machine.send('TIMER');
    expect(cb).toHaveBeenCalledWith({ from: 'green', to: 'yellow', event: 'TIMER' });
  });

  it('onTransition unsubscribe works', () => {
    const machine = trafficLight();
    const cb = vi.fn();
    const unsub = machine.onTransition(cb);
    machine.send('TIMER');
    unsub();
    machine.send('TIMER');
    expect(cb).toHaveBeenCalledOnce();
  });

  it('onTransition does not fire for ignored events', () => {
    const machine = trafficLight();
    const cb = vi.fn();
    machine.onTransition(cb);
    machine.send('NOPE');
    expect(cb).not.toHaveBeenCalled();
  });

  it('guard prevents transition when false', () => {
    const machine = new StateMachine({
      initial: 'locked',
      states: {
        locked: {
          on: { INSERT_COIN: { target: 'unlocked', guard: (ctx) => (ctx.coins || 0) >= 1 } },
        },
        unlocked: {
          on: { PUSH: 'locked' },
          enter: (ctx) => { ctx.coins = 0; },
        },
      },
    });
    machine.send('INSERT_COIN');
    expect(machine.state).toBe('locked');
    (machine.context as any).coins = 1;
    machine.send('INSERT_COIN');
    expect(machine.state).toBe('unlocked');
  });

  it('guard receives current context', () => {
    const guardFn = vi.fn(() => true);
    const machine = new StateMachine({
      initial: 'a',
      states: {
        a: { on: { GO: { target: 'b', guard: guardFn } } },
        b: {},
      },
    });
    (machine.context as any).data = 42;
    machine.send('GO');
    expect(guardFn).toHaveBeenCalledWith(expect.objectContaining({ data: 42 }));
  });

  it('context persists across transitions', () => {
    const machine = new StateMachine({
      initial: 'a',
      states: {
        a: { on: { NEXT: { target: 'b', action: (ctx) => { ctx.step = 1; } } } },
        b: { on: { NEXT: { target: 'c', action: (ctx) => { ctx.step = 2; } } } },
        c: {},
      },
    });
    machine.send('NEXT');
    machine.send('NEXT');
    expect(machine.context.step).toBe(2);
    expect(machine.state).toBe('c');
  });

  it('stress: many transitions', () => {
    const machine = trafficLight();
    for (let i = 0; i < 300; i++) {
      machine.send('TIMER');
    }
    expect(machine.state).toBe('green');
  });

  it('multiple onTransition listeners', () => {
    const machine = trafficLight();
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    machine.onTransition(cb1);
    machine.onTransition(cb2);
    machine.send('TIMER');
    expect(cb1).toHaveBeenCalledOnce();
    expect(cb2).toHaveBeenCalledOnce();
  });

  it('self-transition calls exit then enter', () => {
    const enter = vi.fn();
    const exit = vi.fn();
    const machine = new StateMachine({
      initial: 'idle',
      states: {
        idle: {
          on: { REFRESH: 'idle' },
          enter,
          exit,
        },
      },
    });
    machine.send('REFRESH');
    expect(exit).toHaveBeenCalledOnce();
    expect(enter).toHaveBeenCalledOnce();
  });
});
]==],
  },

  {
    name = "Virtual DOM Differ",
    difficulty = "medium",
    stub = [==[
/**
 * Virtual DOM Differ
 *
 * Implement a minimal virtual DOM diffing algorithm (like React's reconciliation).
 * 
 * A VNode is a plain object representing a DOM element:
 *   { type: string, props: Record<string, any>, children: VNode[] }
 *
 * Implement diff(oldTree, newTree) that returns a list of patch operations:
 *   - { type: 'CREATE', node: VNode } — create a new DOM node
 *   - { type: 'REMOVE' } — remove the DOM node
 *   - { type: 'REPLACE', node: VNode } — replace with a different node
 *   - { type: 'UPDATE', props: Record<string, any> } — update props
 *   - { type: 'REORDER', moves: number[] } — children were reordered
 *
 * Rules:
 * - If node types differ, treat as REPLACE
 * - If types match, check if props changed → UPDATE
 * - Recursively diff children
 * - For simplicity, use index-based child diffing (no key prop for now)
 *
 * Bonus: Implement a simple patch(element, patches) function that applies
 * the patches to a real DOM element.
 */

export interface VNode {
  type: string;
  props: Record<string, any>;
  children: VNode[];
}

export type Patch =
  | { type: 'CREATE'; node: VNode }
  | { type: 'REMOVE' }
  | { type: 'REPLACE'; node: VNode }
  | { type: 'UPDATE'; props: Record<string, any> }
  | { type: 'REORDER'; moves: number[] };

export function diff(oldNode: VNode | null, newNode: VNode | null): Patch[] {
  // YOUR CODE HERE
  return [];
}

/**
 * Bonus: Create a VNode helper for cleaner test syntax.
 */
export function h(type: string, props: Record<string, any> = {}, children: VNode[] = []): VNode {
  // YOUR CODE HERE
  return { type, props, children };
}

/**
 * Bonus: Apply patches to a real DOM element (for browser environment).
 * This is optional — just return if not in browser.
 */
export function patch(element: HTMLElement, patches: Patch[]): void {
  // YOUR CODE HERE
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { diff, h } from './challenge';

describe('Virtual DOM Differ', () => {
  it('no change returns empty patches', () => {
    const node = h('div', { id: 'root' }, []);
    expect(diff(node, node)).toEqual([]);
  });

  it('create from null', () => {
    const node = h('div');
    const patches = diff(null, node);
    expect(patches).toEqual([{ type: 'CREATE', node }]);
  });

  it('remove to null', () => {
    const node = h('div');
    const patches = diff(node, null);
    expect(patches).toEqual([{ type: 'REMOVE' }]);
  });

  it('replace different types', () => {
    const oldNode = h('div');
    const newNode = h('span');
    const patches = diff(oldNode, newNode);
    expect(patches).toEqual([{ type: 'REPLACE', node: newNode }]);
  });

  it('update props on same type', () => {
    const oldNode = h('div', { className: 'old' });
    const newNode = h('div', { className: 'new', id: 'box' });
    const patches = diff(oldNode, newNode);
    expect(patches).toContainEqual({ type: 'UPDATE', props: { className: 'new', id: 'box' } });
  });

  it('no update when props identical', () => {
    const oldNode = h('div', { id: 'x' });
    const newNode = h('div', { id: 'x' });
    const patches = diff(oldNode, newNode);
    expect(patches).toEqual([]);
  });

  it('diff children - add child', () => {
    const oldNode = h('ul', {}, []);
    const newNode = h('ul', {}, [h('li', { key: 'a' })]);
    const patches = diff(oldNode, newNode);
    // Should have a CREATE patch somewhere in the output
    expect(patches.some(p => p.type === 'CREATE')).toBe(true);
  });

  it('diff children - remove child', () => {
    const oldNode = h('ul', {}, [h('li', { key: 'a' })]);
    const newNode = h('ul', {}, []);
    const patches = diff(oldNode, newNode);
    expect(patches.some(p => p.type === 'REMOVE')).toBe(true);
  });

  it('diff children - replace child', () => {
    const oldNode = h('div', {}, [h('span')]);
    const newNode = h('div', {}, [h('p')]);
    const patches = diff(oldNode, newNode);
    expect(patches.some(p => p.type === 'REPLACE')).toBe(true);
  });

  it('nested tree - deep update', () => {
    const oldNode = h('div', {}, [h('span', { id: 'old' })]);
    const newNode = h('div', {}, [h('span', { id: 'new' })]);
    const patches = diff(oldNode, newNode);
    expect(patches.some(p => p.type === 'UPDATE')).toBe(true);
  });

  it('nested tree - no change', () => {
    const oldNode = h('div', {}, [h('span', { id: 'x' }, [h('b')])]);
    const newNode = h('div', {}, [h('span', { id: 'x' }, [h('b')])]);
    expect(diff(oldNode, newNode)).toEqual([]);
  });

  it('multiple children with changes', () => {
    const oldNode = h('ul', {}, [
      h('li', { id: '1' }),
      h('li', { id: '2' }),
    ]);
    const newNode = h('ul', {}, [
      h('li', { id: '1', className: 'active' }),
      h('li', { id: '3' }),
    ]);
    const patches = diff(oldNode, newNode);
    expect(patches.length).toBeGreaterThan(0);
  });

  it('props removed', () => {
    const oldNode = h('div', { id: 'x', className: 'box' });
    const newNode = h('div', { id: 'x' });
    const patches = diff(oldNode, newNode);
    // Should detect className was removed
    expect(patches.some(p => p.type === 'UPDATE')).toBe(true);
  });

  it('stress: deep tree', () => {
    const buildTree = (depth: number): VNode => {
      if (depth === 0) return h('span', { depth });
      return h('div', { depth }, [buildTree(depth - 1), buildTree(depth - 1)]);
    };
    const oldTree = buildTree(5);
    const newTree = buildTree(5);
    const patches = diff(oldTree, newTree);
    expect(patches).toEqual([]);
  });

  it('stress: wide tree', () => {
    const oldNode = h('div', {}, Array.from({ length: 50 }, (_, i) => h('span', { id: i })));
    const newNode = h('div', {}, Array.from({ length: 50 }, (_, i) => h('span', { id: i })));
    expect(diff(oldNode, newNode)).toEqual([]);
  });

  it('change in deeply nested prop', () => {
    const oldNode = h('div', {}, [h('section', {}, [h('p', { id: 'old' })])]);
    const newNode = h('div', {}, [h('section', {}, [h('p', { id: 'new' })])]);
    const patches = diff(oldNode, newNode);
    expect(patches.some(p => p.type === 'UPDATE')).toBe(true);
  });

  it('all children replaced', () => {
    const oldNode = h('div', {}, [h('a'), h('b')]);
    const newNode = h('div', {}, [h('x'), h('y')]);
    const patches = diff(oldNode, newNode);
    expect(patches.filter(p => p.type === 'REPLACE').length).toBe(2);
  });

  it('mixed operations in one diff', () => {
    const oldNode = h('div', { className: 'old' }, [h('span'), h('b')]);
    const newNode = h('div', { className: 'new' }, [h('span'), h('i'), h('strong')]);
    const patches = diff(oldNode, newNode);
    // Should have UPDATE for className, REPLACE for b->i, CREATE for strong
    expect(patches.some(p => p.type === 'UPDATE')).toBe(true);
    expect(patches.some(p => p.type === 'REPLACE')).toBe(true);
    expect(patches.some(p => p.type === 'CREATE')).toBe(true);
  });
});
]==],
  },

  {
    name = "Roman Numeral Converter",
    difficulty = "easy",
    stub = [==[
/**
 * Roman Numeral Converter
 *
 * Implement bidirectional conversion between integers and Roman numerals.
 *
 * Roman numeral symbols:
 *   I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000
 *
 * Subtractive notation rules:
 *   - I before V or X (IV = 4, IX = 9)
 *   - X before L or C (XL = 40, XC = 90)
 *   - C before D or M (CD = 400, CM = 900)
 *
 * toRoman(num: number): string
 *   Convert an integer (1-3999) to Roman numerals.
 *   Examples: 58 → "LVIII", 1994 → "MCMXCIV"
 *
 * fromRoman(roman: string): number
 *   Convert a valid Roman numeral string to an integer.
 *   Examples: "III" → 3, "MCMXC" → 1990
 *
 * Constraints:
 * - Input integers are between 1 and 3999
 * - Roman numeral strings are valid and uppercase
 * - For invalid input, throw an Error
 */

export function toRoman(num: number): string {
  // YOUR CODE HERE
  return '';
}

export function fromRoman(roman: string): number {
  // YOUR CODE HERE
  return 0;
}

/**
 * Bonus: Validate that a string is a properly formatted Roman numeral.
 * Return true if valid, false otherwise.
 */
export function isValidRoman(roman: string): boolean {
  // YOUR CODE HERE
  return false;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { toRoman, fromRoman, isValidRoman } from './challenge';

describe('toRoman', () => {
  it('single symbols', () => {
    expect(toRoman(1)).toBe('I');
    expect(toRoman(5)).toBe('V');
    expect(toRoman(10)).toBe('X');
    expect(toRoman(50)).toBe('L');
    expect(toRoman(100)).toBe('C');
    expect(toRoman(500)).toBe('D');
    expect(toRoman(1000)).toBe('M');
  });

  it('simple addition', () => {
    expect(toRoman(3)).toBe('III');
    expect(toRoman(8)).toBe('VIII');
    expect(toRoman(23)).toBe('XXIII');
  });

  it('subtractive notation', () => {
    expect(toRoman(4)).toBe('IV');
    expect(toRoman(9)).toBe('IX');
    expect(toRoman(40)).toBe('XL');
    expect(toRoman(90)).toBe('XC');
    expect(toRoman(400)).toBe('CD');
    expect(toRoman(900)).toBe('CM');
  });

  it('complex numbers', () => {
    expect(toRoman(58)).toBe('LVIII');
    expect(toRoman(1994)).toBe('MCMXCIV');
    expect(toRoman(2024)).toBe('MMXXIV');
  });

  it('edge cases', () => {
    expect(toRoman(1)).toBe('I');
    expect(toRoman(3999)).toBe('MMMCMXCIX');
  });

  it('throws for out of range', () => {
    expect(() => toRoman(0)).toThrow();
    expect(() => toRoman(4000)).toThrow();
    expect(() => toRoman(-5)).toThrow();
  });

  it('year conversions', () => {
    expect(toRoman(1776)).toBe('MDCCLXXVI');
    expect(toRoman(2000)).toBe('MM');
    expect(toRoman(1492)).toBe('MCDXCII');
  });

  it('numbers with many nines', () => {
    expect(toRoman(99)).toBe('XCIX');
    expect(toRoman(999)).toBe('CMXCIX');
    expect(toRoman(1999)).toBe('MCMXCIX');
  });

  it('round hundreds', () => {
    expect(toRoman(100)).toBe('C');
    expect(toRoman(200)).toBe('CC');
    expect(toRoman(300)).toBe('CCC');
  });

  it('specific test cases', () => {
    expect(toRoman(27)).toBe('XXVII');
    expect(toRoman(444)).toBe('CDXLIV');
    expect(toRoman(3888)).toBe('MMMDCCCLXXXVIII');
  });
});

describe('fromRoman', () => {
  it('single symbols', () => {
    expect(fromRoman('I')).toBe(1);
    expect(fromRoman('V')).toBe(5);
    expect(fromRoman('X')).toBe(10);
    expect(fromRoman('L')).toBe(50);
    expect(fromRoman('C')).toBe(100);
    expect(fromRoman('D')).toBe(500);
    expect(fromRoman('M')).toBe(1000);
  });

  it('simple addition', () => {
    expect(fromRoman('III')).toBe(3);
    expect(fromRoman('VIII')).toBe(8);
    expect(fromRoman('XXIII')).toBe(23);
  });

  it('subtractive notation', () => {
    expect(fromRoman('IV')).toBe(4);
    expect(fromRoman('IX')).toBe(9);
    expect(fromRoman('XL')).toBe(40);
    expect(fromRoman('XC')).toBe(90);
    expect(fromRoman('CD')).toBe(400);
    expect(fromRoman('CM')).toBe(900);
  });

  it('complex numbers', () => {
    expect(fromRoman('LVIII')).toBe(58);
    expect(fromRoman('MCMXCIV')).toBe(1994);
    expect(fromRoman('MMXXIV')).toBe(2024);
  });

  it('edge cases', () => {
    expect(fromRoman('I')).toBe(1);
    expect(fromRoman('MMMCMXCIX')).toBe(3999);
  });

  it('year conversions', () => {
    expect(fromRoman('MDCCLXXVI')).toBe(1776);
    expect(fromRoman('MM')).toBe(2000);
    expect(fromRoman('MCDXCII')).toBe(1492);
  });

  it('throws for invalid input', () => {
    expect(() => fromRoman('IIII')).toThrow();
    expect(() => fromRoman('VV')).toThrow();
    expect(() => fromRoman('ABCD')).toThrow();
    expect(() => fromRoman('')).toThrow();
  });
});

describe('roundtrip conversion', () => {
  it('toRoman and fromRoman are inverses', () => {
    for (let i = 1; i <= 100; i++) {
      expect(fromRoman(toRoman(i))).toBe(i);
    }
  });

  it('random values roundtrip', () => {
    const testValues = [42, 123, 777, 1234, 2468, 3579];
    testValues.forEach(n => {
      expect(fromRoman(toRoman(n))).toBe(n);
    });
  });

  it('stress: all values 1-3999', () => {
    for (let i = 1; i <= 3999; i++) {
      const roman = toRoman(i);
      const back = fromRoman(roman);
      expect(back).toBe(i);
    }
  });
});

describe('isValidRoman', () => {
  it('valid numerals', () => {
    expect(isValidRoman('I')).toBe(true);
    expect(isValidRoman('IV')).toBe(true);
    expect(isValidRoman('MCMXC')).toBe(true);
    expect(isValidRoman('MMMCMXCIX')).toBe(true);
  });

  it('invalid patterns', () => {
    expect(isValidRoman('IIII')).toBe(false);
    expect(isValidRoman('VV')).toBe(false);
    expect(isValidRoman('XXXX')).toBe(false);
    expect(isValidRoman('LL')).toBe(false);
  });

  it('invalid characters', () => {
    expect(isValidRoman('ABC')).toBe(false);
    expect(isValidRoman('I2V')).toBe(false);
    expect(isValidRoman('X-V')).toBe(false);
  });

  it('empty or lowercase', () => {
    expect(isValidRoman('')).toBe(false);
    expect(isValidRoman('mcm')).toBe(false);
  });

  it('invalid subtractive patterns', () => {
    expect(isValidRoman('IL')).toBe(false);
    expect(isValidRoman('IC')).toBe(false);
    expect(isValidRoman('XM')).toBe(false);
  });
});
]==],
  },
  {
    name = "Bloom Filter",
    difficulty = "medium",
    stub = [==[
/**
 * Bloom Filter
 *
 * Implement a Bloom filter — a space-efficient probabilistic data structure
 * used to test whether an element is a member of a set.
 *
 * Key properties:
 * - False positives are possible (may say "yes" when it's "no")
 * - False negatives are NEVER possible (never says "no" when it's "yes")
 * - Space-efficient: uses far less memory than a Set for large datasets
 *
 * BloomFilter class:
 * - constructor(size: number, hashCount: number)
 *   size = bit array size
 *   hashCount = number of hash functions to use
 *
 * - add(item: string): void
 *   Add an item to the filter
 *
 * - contains(item: string): boolean
 *   Returns true if the item MIGHT be in the set
 *   Returns false if the item is DEFINITELY NOT in the set
 *
 * - get fillRatio(): number
 *   Percentage of bits set to 1 (useful for debugging)
 *
 * Implement multiple hash functions by seeding a simple hash with different values.
 *
 * Bonus: Implement estimateFalsePositiveRate() based on current fill ratio.
 */

export class BloomFilter {
  constructor(size: number, hashCount: number) {
    // YOUR CODE HERE
  }

  add(item: string): void {
    // YOUR CODE HERE
  }

  contains(item: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  get fillRatio(): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Estimate the current false positive probability
   * Formula: (fillRatio)^hashCount
   */
  estimateFalsePositiveRate(): number {
    // YOUR CODE HERE
    return 0;
  }
}

/**
 * Bonus: Calculate optimal size and hash count for a given capacity and desired error rate.
 */
export function optimalParams(capacity: number, errorRate: number): { size: number; hashCount: number } {
  // YOUR CODE HERE
  // Formulas:
  // size = -capacity * ln(errorRate) / (ln(2)^2)
  // hashCount = size / capacity * ln(2)
  return { size: 0, hashCount: 0 };
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { BloomFilter, optimalParams } from './challenge';

describe('Bloom Filter', () => {
  it('contains returns true after add', () => {
    const bf = new BloomFilter(100, 3);
    bf.add('hello');
    expect(bf.contains('hello')).toBe(true);
  });

  it('contains returns false for never-added items (high probability)', () => {
    const bf = new BloomFilter(100, 3);
    bf.add('alpha');
    bf.add('beta');
    expect(bf.contains('gamma')).toBe(false);
  });

  it('no false negatives - added items always return true', () => {
    const bf = new BloomFilter(500, 4);
    const items = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
    items.forEach(item => bf.add(item));
    items.forEach(item => expect(bf.contains(item)).toBe(true));
  });

  it('fillRatio increases as items are added', () => {
    const bf = new BloomFilter(1000, 3);
    const initialRatio = bf.fillRatio;
    expect(initialRatio).toBe(0);
    bf.add('test');
    expect(bf.fillRatio).toBeGreaterThan(initialRatio);
  });

  it('multiple hash functions spread bits', () => {
    const bf = new BloomFilter(1000, 5);
    bf.add('test');
    const ratio1 = bf.fillRatio;
    const bf2 = new BloomFilter(1000, 1);
    bf2.add('test');
    const ratio2 = bf2.fillRatio;
    expect(ratio1).toBeGreaterThan(ratio2);
  });

  it('empty filter always returns false', () => {
    const bf = new BloomFilter(100, 3);
    expect(bf.contains('anything')).toBe(false);
  });

  it('same item added multiple times (idempotent)', () => {
    const bf = new BloomFilter(100, 3);
    bf.add('repeat');
    const ratio1 = bf.fillRatio;
    bf.add('repeat');
    bf.add('repeat');
    expect(bf.fillRatio).toBe(ratio1);
  });

  it('different items hash to different positions', () => {
    const bf = new BloomFilter(100, 3);
    bf.add('a');
    bf.add('b');
    bf.add('c');
    const ratio = bf.fillRatio;
    expect(ratio).toBeGreaterThan(0);
    expect(ratio).toBeLessThan(0.5);
  });

  it('false positive rate increases with fill ratio', () => {
    const bf = new BloomFilter(100, 3);
    const initialFPR = bf.estimateFalsePositiveRate();
    for (let i = 0; i < 50; i++) {
      bf.add(`item${i}`);
    }
    const finalFPR = bf.estimateFalsePositiveRate();
    expect(finalFPR).toBeGreaterThan(initialFPR);
  });

  it('small filter has more false positives', () => {
    const small = new BloomFilter(50, 3);
    const large = new BloomFilter(500, 3);
    
    for (let i = 0; i < 20; i++) {
      small.add(`item${i}`);
      large.add(`item${i}`);
    }

    let smallFP = 0, largeFP = 0;
    for (let i = 100; i < 200; i++) {
      if (small.contains(`item${i}`)) smallFP++;
      if (large.contains(`item${i}`)) largeFP++;
    }
    
    expect(smallFP).toBeGreaterThan(largeFP);
  });

  it('stress: many items', () => {
    const bf = new BloomFilter(10000, 5);
    const items: string[] = [];
    for (let i = 0; i < 1000; i++) {
      const item = `test${i}`;
      items.push(item);
      bf.add(item);
    }
    
    // No false negatives
    items.forEach(item => expect(bf.contains(item)).toBe(true));
    
    // Check false positive rate
    let falsePositives = 0;
    for (let i = 1000; i < 2000; i++) {
      if (bf.contains(`test${i}`)) falsePositives++;
    }
    const fpr = falsePositives / 1000;
    expect(fpr).toBeLessThan(0.1);
  });

  it('different hash counts affect collision probability', () => {
    const bf1 = new BloomFilter(1000, 2);
    const bf2 = new BloomFilter(1000, 6);
    
    for (let i = 0; i < 50; i++) {
      bf1.add(`item${i}`);
      bf2.add(`item${i}`);
    }
    
    expect(bf1.fillRatio).toBeLessThan(bf2.fillRatio);
  });

  it('unicode strings work', () => {
    const bf = new BloomFilter(200, 3);
    bf.add('🎯');
    bf.add('hello世界');
    bf.add('Ñoño');
    expect(bf.contains('🎯')).toBe(true);
    expect(bf.contains('hello世界')).toBe(true);
    expect(bf.contains('Ñoño')).toBe(true);
  });

  it('empty string is valid', () => {
    const bf = new BloomFilter(100, 3);
    bf.add('');
    expect(bf.contains('')).toBe(true);
  });
});

describe('optimalParams', () => {
  it('calculates reasonable parameters', () => {
    const { size, hashCount } = optimalParams(1000, 0.01);
    expect(size).toBeGreaterThan(1000);
    expect(hashCount).toBeGreaterThan(1);
    expect(hashCount).toBeLessThan(20);
  });

  it('lower error rate needs more space', () => {
    const low = optimalParams(1000, 0.001);
    const high = optimalParams(1000, 0.1);
    expect(low.size).toBeGreaterThan(high.size);
  });

  it('larger capacity needs more space', () => {
    const small = optimalParams(100, 0.01);
    const large = optimalParams(10000, 0.01);
    expect(large.size).toBeGreaterThan(small.size);
  });
});
]==],
  },

  {
    name = "Token Bucket Rate Limiter",
    difficulty = "medium",
    stub = [==[
/**
 * Token Bucket Rate Limiter
 *
 * Implement a rate limiter using the token bucket algorithm.
 * This algorithm is widely used in production systems (AWS, Stripe, etc.)
 *
 * TokenBucket class:
 * - constructor(capacity: number, refillRate: number, refillIntervalMs: number)
 *   capacity: maximum number of tokens in the bucket
 *   refillRate: how many tokens are added each refill
 *   refillIntervalMs: how often tokens are added (in milliseconds)
 *
 * - tryConsume(tokens: number = 1, now?: number): boolean
 *   Try to consume `tokens` from the bucket. Returns true if successful.
 *   `now` parameter allows injecting time for testing (defaults to Date.now())
 *
 * - peek(now?: number): number
 *   Return the current number of available tokens without consuming any.
 *
 * - reset(): void
 *   Reset the bucket to full capacity.
 *
 * Example:
 *   const limiter = new TokenBucket(10, 1, 100); // 10 tokens max, +1 every 100ms
 *   limiter.tryConsume(3);  // true (7 tokens left)
 *   limiter.tryConsume(10); // false (only 7 available)
 *
 * Bonus: Implement MultiKeyLimiter that manages separate buckets per key (like user ID).
 *   - tryConsume(key: string, tokens?: number): boolean
 *   - cleanup(): void — Remove inactive buckets (not accessed in last minute)
 */

export class TokenBucket {
  constructor(
    capacity: number,
    refillRate: number,
    refillIntervalMs: number
  ) {
    // YOUR CODE HERE
  }

  tryConsume(tokens: number = 1, now?: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  peek(now?: number): number {
    // YOUR CODE HERE
    return 0;
  }

  reset(): void {
    // YOUR CODE HERE
  }
}

/**
 * Bonus: Multi-key rate limiter
 */
export class MultiKeyLimiter {
  constructor(
    capacity: number,
    refillRate: number,
    refillIntervalMs: number
  ) {
    // YOUR CODE HERE
  }

  tryConsume(key: string, tokens: number = 1, now?: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  cleanup(now?: number): void {
    // YOUR CODE HERE
  }

  get keyCount(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { TokenBucket, MultiKeyLimiter } from './challenge';

describe('Token Bucket', () => {
  beforeEach(() => { vi.useFakeTimers(); });
  afterEach(() => { vi.restoreAllTimers(); });

  it('starts with full capacity', () => {
    const bucket = new TokenBucket(10, 1, 100);
    expect(bucket.peek(0)).toBe(10);
  });

  it('consumes tokens successfully', () => {
    const bucket = new TokenBucket(10, 1, 100);
    expect(bucket.tryConsume(3, 0)).toBe(true);
    expect(bucket.peek(0)).toBe(7);
  });

  it('rejects when not enough tokens', () => {
    const bucket = new TokenBucket(5, 1, 100);
    bucket.tryConsume(3, 0);
    expect(bucket.tryConsume(5, 0)).toBe(false);
    expect(bucket.peek(0)).toBe(2);
  });

  it('refills tokens over time', () => {
    const bucket = new TokenBucket(10, 2, 100);
    bucket.tryConsume(8, 0);
    expect(bucket.peek(0)).toBe(2);
    expect(bucket.peek(100)).toBe(4);
    expect(bucket.peek(200)).toBe(6);
  });

  it('caps at max capacity', () => {
    const bucket = new TokenBucket(10, 5, 100);
    bucket.tryConsume(5, 0);
    expect(bucket.peek(500)).toBe(10);
  });

  it('multiple partial refills', () => {
    const bucket = new TokenBucket(100, 1, 50);
    bucket.tryConsume(50, 0);
    expect(bucket.peek(0)).toBe(50);
    expect(bucket.peek(125)).toBe(52);
    expect(bucket.peek(275)).toBe(55);
  });

  it('consumes exact amount available', () => {
    const bucket = new TokenBucket(5, 1, 100);
    expect(bucket.tryConsume(5, 0)).toBe(true);
    expect(bucket.peek(0)).toBe(0);
  });

  it('zero consumption always succeeds', () => {
    const bucket = new TokenBucket(5, 1, 100);
    bucket.tryConsume(5, 0);
    expect(bucket.tryConsume(0, 0)).toBe(true);
    expect(bucket.peek(0)).toBe(0);
  });

  it('reset refills to capacity', () => {
    const bucket = new TokenBucket(10, 1, 100);
    bucket.tryConsume(8, 0);
    bucket.reset();
    expect(bucket.peek(0)).toBe(10);
  });

  it('refill does not overshoot capacity', () => {
    const bucket = new TokenBucket(10, 100, 10);
    bucket.tryConsume(5, 0);
    expect(bucket.peek(100)).toBe(10);
  });

  it('handles fractional intervals correctly', () => {
    const bucket = new TokenBucket(10, 1, 33);
    bucket.tryConsume(5, 0);
    expect(bucket.peek(33)).toBe(6);
    expect(bucket.peek(66)).toBe(7);
    expect(bucket.peek(99)).toBe(8);
  });

  it('large time jump refills correctly', () => {
    const bucket = new TokenBucket(100, 10, 100);
    bucket.tryConsume(100, 0);
    expect(bucket.peek(10000)).toBe(100);
  });

  it('burst then steady consumption', () => {
    const bucket = new TokenBucket(10, 1, 100);
    expect(bucket.tryConsume(10, 0)).toBe(true);
    expect(bucket.tryConsume(1, 50)).toBe(false);
    expect(bucket.tryConsume(1, 100)).toBe(true);
    expect(bucket.tryConsume(1, 200)).toBe(true);
  });

  it('stress: rapid consumption attempts', () => {
    const bucket = new TokenBucket(100, 1, 10);
    let successful = 0;
    for (let i = 0; i < 200; i++) {
      if (bucket.tryConsume(1, i * 5)) successful++;
    }
    expect(successful).toBeGreaterThan(100);
    expect(successful).toBeLessThan(200);
  });

  it('peek does not consume', () => {
    const bucket = new TokenBucket(10, 1, 100);
    bucket.tryConsume(5, 0);
    const before = bucket.peek(0);
    bucket.peek(0);
    bucket.peek(0);
    expect(bucket.peek(0)).toBe(before);
  });

  it('negative time does not break', () => {
    const bucket = new TokenBucket(10, 1, 100);
    bucket.tryConsume(5, 100);
    expect(bucket.peek(50)).toBe(5);
  });

  it('very small refill rate', () => {
    const bucket = new TokenBucket(1000, 1, 10000);
    bucket.tryConsume(500, 0);
    expect(bucket.peek(0)).toBe(500);
    expect(bucket.peek(10000)).toBe(501);
  });

  it('very fast refill rate', () => {
    const bucket = new TokenBucket(10, 10, 1);
    bucket.tryConsume(10, 0);
    expect(bucket.peek(5)).toBe(10);
  });
});

describe('MultiKeyLimiter', () => {
  beforeEach(() => { vi.useFakeTimers(); });
  afterEach(() => { vi.restoreAllTimers(); });

  it('different keys have independent buckets', () => {
    const limiter = new MultiKeyLimiter(5, 1, 100);
    limiter.tryConsume('user1', 3, 0);
    limiter.tryConsume('user2', 2, 0);
    expect(limiter.tryConsume('user1', 3, 0)).toBe(false);
    expect(limiter.tryConsume('user2', 3, 0)).toBe(true);
  });

  it('keyCount tracks active buckets', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    expect(limiter.keyCount).toBe(0);
    limiter.tryConsume('a', 1, 0);
    limiter.tryConsume('b', 1, 0);
    limiter.tryConsume('c', 1, 0);
    expect(limiter.keyCount).toBe(3);
  });

  it('cleanup removes inactive buckets', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    limiter.tryConsume('user1', 1, 0);
    limiter.tryConsume('user2', 1, 1000);
    limiter.tryConsume('user3', 1, 59000);
    limiter.cleanup(60000);
    expect(limiter.keyCount).toBe(1);
  });

  it('cleanup does not remove recently used', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    limiter.tryConsume('recent', 1, 50000);
    limiter.cleanup(60000);
    expect(limiter.keyCount).toBe(1);
  });

  it('same key uses same bucket', () => {
    const limiter = new MultiKeyLimiter(5, 1, 100);
    limiter.tryConsume('user', 2, 0);
    limiter.tryConsume('user', 2, 0);
    expect(limiter.tryConsume('user', 2, 0)).toBe(false);
  });

  it('refill works per key', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    limiter.tryConsume('user', 8, 0);
    expect(limiter.tryConsume('user', 5, 200)).toBe(false);
    expect(limiter.tryConsume('user', 4, 200)).toBe(true);
  });

  it('cleanup with no buckets', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    expect(() => limiter.cleanup(1000)).not.toThrow();
    expect(limiter.keyCount).toBe(0);
  });

  it('stress: many keys', () => {
    const limiter = new MultiKeyLimiter(100, 10, 100);
    for (let i = 0; i < 500; i++) {
      limiter.tryConsume(`user${i}`, 50, i * 10);
    }
    expect(limiter.keyCount).toBe(500);
    limiter.cleanup(10000);
    expect(limiter.keyCount).toBeLessThan(100);
  });

  it('cleanup threshold is 60 seconds', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    limiter.tryConsume('old', 1, 0);
    limiter.tryConsume('edge', 1, 59999);
    limiter.tryConsume('fresh', 1, 60000);
    limiter.cleanup(120000);
    expect(limiter.keyCount).toBeGreaterThan(0);
  });

  it('multiple cleanups work correctly', () => {
    const limiter = new MultiKeyLimiter(10, 1, 100);
    limiter.tryConsume('a', 1, 0);
    limiter.tryConsume('b', 1, 10000);
    limiter.cleanup(70000);
    limiter.tryConsume('c', 1, 80000);
    limiter.cleanup(140000);
    expect(limiter.keyCount).toBe(1);
  });
});
]==],
  },

  {
    name = "Binary Search Tree Operations",
    difficulty = "medium",
    stub = [==[
/**
 * Binary Search Tree Operations
 *
 * Implement a Binary Search Tree with core operations and traversals.
 *
 * TreeNode: { val: number, left: TreeNode | null, right: TreeNode | null }
 *
 * Implement:
 * - insert(root, val) — Insert a value into the BST. Return the new root.
 * - search(root, val) — Search for a value. Return the node or null.
 * - delete(root, val) — Delete a value from the BST. Return the new root.
 * - findMin(root) — Find the minimum value in the BST.
 * - findMax(root) — Find the maximum value in the BST.
 * - inorder(root) — Return values in sorted order (left → root → right).
 * - validate(root) — Check if a tree is a valid BST.
 * - kthSmallest(root, k) — Find the k-th smallest element (1-indexed).
 *
 * Bonus: Implement findLCA(root, p, q) to find the Lowest Common Ancestor.
 */

export class TreeNode {
  val: number;
  left: TreeNode | null;
  right: TreeNode | null;
  constructor(val: number, left: TreeNode | null = null, right: TreeNode | null = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

export function insert(root: TreeNode | null, val: number): TreeNode {
  // YOUR CODE HERE
  return new TreeNode(val);
}

export function search(root: TreeNode | null, val: number): TreeNode | null {
  // YOUR CODE HERE
  return null;
}

export function deleteNode(root: TreeNode | null, val: number): TreeNode | null {
  // YOUR CODE HERE
  return null;
}

export function findMin(root: TreeNode | null): number | null {
  // YOUR CODE HERE
  return null;
}

export function findMax(root: TreeNode | null): number | null {
  // YOUR CODE HERE
  return null;
}

export function inorder(root: TreeNode | null): number[] {
  // YOUR CODE HERE
  return [];
}

export function validate(root: TreeNode | null): boolean {
  // YOUR CODE HERE
  return false;
}

export function kthSmallest(root: TreeNode | null, k: number): number | null {
  // YOUR CODE HERE
  return null;
}

export function findLCA(root: TreeNode | null, p: number, q: number): TreeNode | null {
  // YOUR CODE HERE
  return null;
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { TreeNode, insert, search, deleteNode, findMin, findMax, inorder, validate, kthSmallest, findLCA } from './challenge';

function buildTree(values: (number | null)[]): TreeNode | null {
  if (!values.length || values[0] === null) return null;
  const root = new TreeNode(values[0]);
  const queue = [root];
  let i = 1;
  while (i < values.length) {
    const node = queue.shift()!;
    if (values[i] !== null) {
      node.left = new TreeNode(values[i]!);
      queue.push(node.left);
    }
    i++;
    if (i < values.length && values[i] !== null) {
      node.right = new TreeNode(values[i]!);
      queue.push(node.right);
    }
    i++;
  }
  return root;
}

describe('insert', () => {
  it('insert into empty tree', () => {
    const root = insert(null, 5);
    expect(root.val).toBe(5);
  });

  it('builds correct BST structure', () => {
    let root = null;
    [5, 3, 7, 1, 4, 6, 9].forEach(v => { root = insert(root, v); });
    expect(inorder(root)).toEqual([1, 3, 4, 5, 6, 7, 9]);
  });

  it('maintains BST property after multiple inserts', () => {
    let root = null;
    [10, 5, 15, 3, 7, 12, 20].forEach(v => { root = insert(root, v); });
    expect(validate(root)).toBe(true);
  });
});

describe('search', () => {
  const root = buildTree([5, 3, 7, 1, 4, 6, 9]);

  it('finds existing value', () => {
    expect(search(root, 7)?.val).toBe(7);
    expect(search(root, 1)?.val).toBe(1);
  });

  it('returns null for missing value', () => {
    expect(search(root, 99)).toBe(null);
  });

  it('searches empty tree', () => {
    expect(search(null, 5)).toBe(null);
  });
});

describe('deleteNode', () => {
  it('delete leaf node', () => {
    let root = buildTree([5, 3, 7, 1, 4, 6, 9]);
    root = deleteNode(root, 1);
    expect(inorder(root)).toEqual([3, 4, 5, 6, 7, 9]);
  });

  it('delete node with one child', () => {
    let root = buildTree([5, 3, 7, null, 4, 6, 9]);
    root = deleteNode(root, 3);
    expect(inorder(root)).toEqual([4, 5, 6, 7, 9]);
  });

  it('delete node with two children', () => {
    let root = buildTree([5, 3, 7, 1, 4, 6, 9]);
    root = deleteNode(root, 5);
    const values = inorder(root);
    expect(values).toEqual([1, 3, 4, 6, 7, 9]);
    expect(validate(root)).toBe(true);
  });

  it('delete root', () => {
    let root = buildTree([5]);
    root = deleteNode(root, 5);
    expect(root).toBe(null);
  });

  it('delete non-existent value', () => {
    let root = buildTree([5, 3, 7]);
    root = deleteNode(root, 99);
    expect(inorder(root)).toEqual([3, 5, 7]);
  });
});

describe('findMin and findMax', () => {
  const root = buildTree([5, 3, 7, 1, 4, 6, 9]);

  it('finds minimum', () => {
    expect(findMin(root)).toBe(1);
  });

  it('finds maximum', () => {
    expect(findMax(root)).toBe(9);
  });

  it('empty tree returns null', () => {
    expect(findMin(null)).toBe(null);
    expect(findMax(null)).toBe(null);
  });

  it('single node', () => {
    const single = new TreeNode(42);
    expect(findMin(single)).toBe(42);
    expect(findMax(single)).toBe(42);
  });
});

describe('inorder', () => {
  it('returns sorted values', () => {
    const root = buildTree([5, 3, 7, 1, 4, 6, 9]);
    expect(inorder(root)).toEqual([1, 3, 4, 5, 6, 7, 9]);
  });

  it('empty tree', () => {
    expect(inorder(null)).toEqual([]);
  });

  it('single node', () => {
    expect(inorder(new TreeNode(10))).toEqual([10]);
  });

  it('skewed tree', () => {
    const root = buildTree([1, null, 2, null, 3, null, 4]);
    expect(inorder(root)).toEqual([1, 2, 3, 4]);
  });
});

describe('validate', () => {
  it('valid BST', () => {
    const root = buildTree([5, 3, 7, 1, 4, 6, 9]);
    expect(validate(root)).toBe(true);
  });

  it('invalid BST - left > root', () => {
    const root = new TreeNode(5);
    root.left = new TreeNode(7);
    root.right = new TreeNode(10);
    expect(validate(root)).toBe(false);
  });

  it('invalid BST - right < root', () => {
    const root = new TreeNode(5);
    root.left = new TreeNode(3);
    root.right = new TreeNode(4);
    expect(validate(root)).toBe(false);
  });

  it('invalid BST - violates range constraint', () => {
    const root = new TreeNode(10);
    root.left = new TreeNode(5);
    root.left.right = new TreeNode(15);
    expect(validate(root)).toBe(false);
  });

  it('empty tree is valid', () => {
    expect(validate(null)).toBe(true);
  });

  it('single node is valid', () => {
    expect(validate(new TreeNode(5))).toBe(true);
  });
});

describe('kthSmallest', () => {
  const root = buildTree([5, 3, 7, 1, 4, 6, 9]);

  it('finds 1st smallest', () => {
    expect(kthSmallest(root, 1)).toBe(1);
  });

  it('finds 4th smallest', () => {
    expect(kthSmallest(root, 4)).toBe(5);
  });

  it('finds last element', () => {
    expect(kthSmallest(root, 7)).toBe(9);
  });

  it('k out of bounds returns null', () => {
    expect(kthSmallest(root, 0)).toBe(null);
    expect(kthSmallest(root, 100)).toBe(null);
  });

  it('empty tree', () => {
    expect(kthSmallest(null, 1)).toBe(null);
  });
});

describe('findLCA', () => {
  const root = buildTree([6, 2, 8, 0, 4, 7, 9, null, null, 3, 5]);

  it('LCA of nodes on different sides', () => {
    expect(findLCA(root, 2, 8)?.val).toBe(6);
  });

  it('LCA when one is ancestor of other', () => {
    expect(findLCA(root, 2, 4)?.val).toBe(2);
  });

  it('LCA of nodes in left subtree', () => {
    expect(findLCA(root, 0, 5)?.val).toBe(2);
  });

  it('LCA of nodes in right subtree', () => {
    expect(findLCA(root, 7, 9)?.val).toBe(8);
  });

  it('one or both values missing', () => {
    expect(findLCA(root, 99, 100)).toBe(null);
  });

  it('same value', () => {
    const lca = findLCA(root, 4, 4);
    expect(lca?.val).toBe(4);
  });
});

describe('stress tests', () => {
  it('large tree insertion and traversal', () => {
    let root = null;
    const values = Array.from({ length: 500 }, (_, i) => i);
    values.sort(() => Math.random() - 0.5);
    values.forEach(v => { root = insert(root, v); });
    expect(validate(root)).toBe(true);
    const sorted = inorder(root);
    expect(sorted).toEqual(Array.from({ length: 500 }, (_, i) => i));
  });

  it('sequential inserts maintain validity', () => {
    let root = null;
    for (let i = 1; i <= 100; i++) {
      root = insert(root, i);
    }
    expect(validate(root)).toBe(true);
    expect(findMin(root)).toBe(1);
    expect(findMax(root)).toBe(100);
  });

  it('many deletions', () => {
    let root = null;
    [50, 25, 75, 12, 37, 62, 87].forEach(v => { root = insert(root, v); });
    root = deleteNode(root, 25);
    root = deleteNode(root, 75);
    root = deleteNode(root, 50);
    expect(validate(root)).toBe(true);
    expect(inorder(root)).toEqual([12, 37, 62, 87]);
  });
});
]==],
  },
  {
      name = "Sorted Set (Redis-style)",
      difficulty = "hard",
      stub = [==[
  /**
   * Sorted Set (Redis-style)
   *
   * Implement a sorted set data structure similar to Redis ZSET.
   * Elements are unique strings with numeric scores. The set is sorted by score,
   * with ties broken by lexicographic order of the element.
   *
   * SortedSet class:
   * - add(member: string, score: number): boolean
   *   Add or update a member with a score. Returns true if new member, false if update.
   *
   * - remove(member: string): boolean
   *   Remove a member. Returns true if it existed, false otherwise.
   *
   * - score(member: string): number | null
   *   Get the score of a member, or null if not found.
   *
   * - rank(member: string): number | null
   *   Get the 0-based rank (position in sorted order), or null if not found.
   *
   * - range(start: number, stop: number): string[]
   *   Get members by rank range [start, stop] (0-indexed, inclusive).
   *   Negative indices count from the end (-1 = last element).
   *
   * - rangeByScore(min: number, max: number, limit?: number): string[]
   *   Get members with scores in [min, max], limited to `limit` results.
   *
   * - count(): number
   *   Total number of members.
   *
   * Bonus: Implement incrementBy(member, delta) and removeRangeByScore(min, max).
   *
   * Implementation notes:
   * - Maintain O(log n) add/remove using a balanced tree or skip list approach
   * - For simplicity, you may use an array + binary search (O(n) inserts but easier)
   * - Real Redis uses a skip list + hash map hybrid
   */
  
  export class SortedSet {
    constructor() {
      // YOUR CODE HERE
    }
  
    add(member: string, score: number): boolean {
      // YOUR CODE HERE
      return false;
    }
  
    remove(member: string): boolean {
      // YOUR CODE HERE
      return false;
    }
  
    score(member: string): number | null {
      // YOUR CODE HERE
      return null;
    }
  
    rank(member: string): number | null {
      // YOUR CODE HERE
      return null;
    }
  
    range(start: number, stop: number): string[] {
      // YOUR CODE HERE
      return [];
    }
  
    rangeByScore(min: number, max: number, limit?: number): string[] {
      // YOUR CODE HERE
      return [];
    }
  
    count(): number {
      // YOUR CODE HERE
      return 0;
    }
  
    /**
     * Bonus: Increment a member's score by delta.
     * If member doesn't exist, treat initial score as 0.
     */
    incrementBy(member: string, delta: number): number {
      // YOUR CODE HERE
      return 0;
    }
  
    /**
     * Bonus: Remove all members with scores in [min, max].
     * Returns the count of removed members.
     */
    removeRangeByScore(min: number, max: number): number {
      // YOUR CODE HERE
      return 0;
    }
  }
  ]==],
      tests = [==[
  import { describe, it, expect } from 'vitest';
  import { SortedSet } from './challenge';
  
  describe('SortedSet', () => {
    it('add new member returns true', () => {
      const zset = new SortedSet();
      expect(zset.add('alice', 100)).toBe(true);
      expect(zset.count()).toBe(1);
    });
  
    it('update existing member returns false', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      expect(zset.add('alice', 200)).toBe(false);
      expect(zset.count()).toBe(1);
    });
  
    it('score returns correct value', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      expect(zset.score('alice')).toBe(100);
    });
  
    it('score returns null for missing member', () => {
      const zset = new SortedSet();
      expect(zset.score('nobody')).toBe(null);
    });
  
    it('remove existing member returns true', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      expect(zset.remove('alice')).toBe(true);
      expect(zset.count()).toBe(0);
    });
  
    it('remove non-existent member returns false', () => {
      const zset = new SortedSet();
      expect(zset.remove('nobody')).toBe(false);
    });
  
    it('rank returns position in sorted order', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      zset.add('bob', 200);
      zset.add('charlie', 150);
      expect(zset.rank('alice')).toBe(0);
      expect(zset.rank('charlie')).toBe(1);
      expect(zset.rank('bob')).toBe(2);
    });
  
    it('rank returns null for missing member', () => {
      const zset = new SortedSet();
      expect(zset.rank('nobody')).toBe(null);
    });
  
    it('range returns members in order', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      zset.add('bob', 200);
      zset.add('charlie', 150);
      expect(zset.range(0, 2)).toEqual(['alice', 'charlie', 'bob']);
    });
  
    it('range with negative indices', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      zset.add('b', 2);
      zset.add('c', 3);
      expect(zset.range(-2, -1)).toEqual(['b', 'c']);
    });
  
    it('range subset', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      zset.add('b', 2);
      zset.add('c', 3);
      zset.add('d', 4);
      expect(zset.range(1, 2)).toEqual(['b', 'c']);
    });
  
    it('rangeByScore returns members within score range', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      zset.add('bob', 200);
      zset.add('charlie', 150);
      zset.add('dave', 175);
      expect(zset.rangeByScore(100, 175)).toEqual(['alice', 'charlie', 'dave']);
    });
  
    it('rangeByScore with limit', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      zset.add('b', 2);
      zset.add('c', 3);
      zset.add('d', 4);
      expect(zset.rangeByScore(1, 10, 2)).toEqual(['a', 'b']);
    });
  
    it('rangeByScore no matches', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      expect(zset.rangeByScore(10, 20)).toEqual([]);
    });
  
    it('lexicographic tie-breaking', () => {
      const zset = new SortedSet();
      zset.add('zebra', 100);
      zset.add('apple', 100);
      zset.add('banana', 100);
      expect(zset.range(0, 2)).toEqual(['apple', 'banana', 'zebra']);
    });
  
    it('update changes rank', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      zset.add('bob', 200);
      expect(zset.rank('alice')).toBe(0);
      zset.add('alice', 300);
      expect(zset.rank('alice')).toBe(1);
    });
  
    it('count reflects current size', () => {
      const zset = new SortedSet();
      expect(zset.count()).toBe(0);
      zset.add('a', 1);
      zset.add('b', 2);
      expect(zset.count()).toBe(2);
      zset.remove('a');
      expect(zset.count()).toBe(1);
    });
  
    it('empty range', () => {
      const zset = new SortedSet();
      expect(zset.range(0, 10)).toEqual([]);
    });
  
    it('range out of bounds', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      expect(zset.range(10, 20)).toEqual([]);
    });
  
    it('incrementBy on new member', () => {
      const zset = new SortedSet();
      const newScore = zset.incrementBy('alice', 50);
      expect(newScore).toBe(50);
      expect(zset.score('alice')).toBe(50);
    });
  
    it('incrementBy on existing member', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      const newScore = zset.incrementBy('alice', 25);
      expect(newScore).toBe(125);
      expect(zset.score('alice')).toBe(125);
    });
  
    it('incrementBy negative delta', () => {
      const zset = new SortedSet();
      zset.add('alice', 100);
      const newScore = zset.incrementBy('alice', -30);
      expect(newScore).toBe(70);
    });
  
    it('removeRangeByScore removes matching members', () => {
      const zset = new SortedSet();
      zset.add('a', 10);
      zset.add('b', 20);
      zset.add('c', 30);
      zset.add('d', 40);
      const removed = zset.removeRangeByScore(20, 30);
      expect(removed).toBe(2);
      expect(zset.count()).toBe(2);
      expect(zset.range(0, -1)).toEqual(['a', 'd']);
    });
  
    it('removeRangeByScore no matches', () => {
      const zset = new SortedSet();
      zset.add('a', 10);
      expect(zset.removeRangeByScore(50, 100)).toBe(0);
      expect(zset.count()).toBe(1);
    });
  
    it('stress: many members', () => {
      const zset = new SortedSet();
      for (let i = 0; i < 1000; i++) {
        zset.add(`user${i}`, Math.random() * 1000);
      }
      expect(zset.count()).toBe(1000);
      const top10 = zset.range(0, 9);
      expect(top10.length).toBe(10);
    });
  
    it('stress: repeated updates', () => {
      const zset = new SortedSet();
      zset.add('player', 0);
      for (let i = 0; i < 100; i++) {
        zset.incrementBy('player', 1);
      }
      expect(zset.score('player')).toBe(100);
    });
  
    it('range clamps correctly', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      zset.add('b', 2);
      zset.add('c', 3);
      expect(zset.range(-100, 100)).toEqual(['a', 'b', 'c']);
    });
  
    it('identical scores with many members', () => {
      const zset = new SortedSet();
      const names = ['zoe', 'alice', 'charlie', 'bob'];
      names.forEach(n => zset.add(n, 100));
      expect(zset.range(0, -1)).toEqual(['alice', 'bob', 'charlie', 'zoe']);
    });
  
    it('score boundary inclusion', () => {
      const zset = new SortedSet();
      zset.add('a', 10);
      zset.add('b', 20);
      zset.add('c', 30);
      expect(zset.rangeByScore(10, 20)).toEqual(['a', 'b']);
      expect(zset.rangeByScore(15, 25)).toEqual(['b']);
    });
  
    it('negative scores', () => {
      const zset = new SortedSet();
      zset.add('a', -10);
      zset.add('b', 0);
      zset.add('c', 10);
      expect(zset.range(0, 2)).toEqual(['a', 'b', 'c']);
      expect(zset.rangeByScore(-5, 5)).toEqual(['b']);
    });
  
    it('decimal scores', () => {
      const zset = new SortedSet();
      zset.add('a', 1.5);
      zset.add('b', 1.7);
      zset.add('c', 1.3);
      expect(zset.range(0, -1)).toEqual(['c', 'a', 'b']);
    });
  
    it('remove updates ranks correctly', () => {
      const zset = new SortedSet();
      zset.add('a', 1);
      zset.add('b', 2);
      zset.add('c', 3);
      zset.remove('b');
      expect(zset.rank('a')).toBe(0);
      expect(zset.rank('c')).toBe(1);
    });
  
    it('empty set operations', () => {
      const zset = new SortedSet();
      expect(zset.count()).toBe(0);
      expect(zset.range(0, 10)).toEqual([]);
      expect(zset.rangeByScore(0, 100)).toEqual([]);
      expect(zset.rank('any')).toBe(null);
      expect(zset.score('any')).toBe(null);
    });
  
    it('single member operations', () => {
      const zset = new SortedSet();
      zset.add('solo', 42);
      expect(zset.rank('solo')).toBe(0);
      expect(zset.range(0, 0)).toEqual(['solo']);
      expect(zset.rangeByScore(40, 50)).toEqual(['solo']);
    });
  });
  ]==],
    },
  {
    name = "Reactive Signal System",
    difficulty = "medium",
    stub = [==[
/**
 * Reactive Signal System
 *
 * Implement a minimal reactivity system inspired by SolidJS, Vue 3, and Preact Signals.
 * Signals are reactive primitives that automatically track dependencies and propagate updates.
 *
 * Core primitives:
 * - signal<T>(initial: T) — Creates a reactive value with get/set
 * - computed<T>(fn: () => T) — Creates a derived value that auto-updates when dependencies change
 * - effect(fn: () => void) — Runs a side-effect that auto-re-runs when dependencies change
 *
 * Rules:
 * - When a signal's value changes, all dependent computeds and effects re-run automatically
 * - Computeds are lazy: only recompute when accessed AND dependencies have changed
 * - Effects run immediately on creation, then re-run when dependencies change
 * - Avoid infinite loops: effects should not trigger themselves
 *
 * Example:
 *   const count = signal(0);
 *   const doubled = computed(() => count() * 2);
 *   effect(() => console.log('Count:', count()));
 *   count.set(5);  // Console logs "Count: 5", doubled() now returns 10
 *
 * Bonus: Implement batch() to defer updates until a transaction completes.
 */

type SignalGetter<T> = {
  (): T;
  subscribe(fn: () => void): () => void;
};

type SignalSetter<T> = (value: T | ((prev: T) => T)) => void;

interface Signal<T> extends SignalGetter<T> {
  set: SignalSetter<T>;
}

interface Computed<T> extends SignalGetter<T> {}

interface EffectCleanup {
  dispose(): void;
}

export function signal<T>(initial: T): Signal<T> {
  // YOUR CODE HERE
  const get: any = () => initial;
  get.set = () => {};
  get.subscribe = () => () => {};
  return get;
}

export function computed<T>(fn: () => T): Computed<T> {
  // YOUR CODE HERE
  const get: any = () => fn();
  get.subscribe = () => () => {};
  return get;
}

export function effect(fn: () => void | (() => void)): EffectCleanup {
  // YOUR CODE HERE
  return { dispose: () => {} };
}

/**
 * Bonus: Batch updates to avoid multiple re-runs of effects.
 * All signal updates within the callback are deferred until the function completes.
 */
export function batch(fn: () => void): void {
  // YOUR CODE HERE
  fn();
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { signal, computed, effect, batch } from './challenge';

describe('Reactive Signal System', () => {
  it('signal stores and retrieves value', () => {
    const count = signal(10);
    expect(count()).toBe(10);
  });

  it('signal set updates value', () => {
    const count = signal(5);
    count.set(20);
    expect(count()).toBe(20);
  });

  it('signal set with updater function', () => {
    const count = signal(10);
    count.set(prev => prev + 5);
    expect(count()).toBe(15);
  });

  it('computed derives from signal', () => {
    const count = signal(3);
    const doubled = computed(() => count() * 2);
    expect(doubled()).toBe(6);
  });

  it('computed updates when signal changes', () => {
    const count = signal(5);
    const squared = computed(() => count() * count());
    expect(squared()).toBe(25);
    count.set(10);
    expect(squared()).toBe(100);
  });

  it('effect runs immediately on creation', () => {
    const fn = vi.fn();
    effect(fn);
    expect(fn).toHaveBeenCalledOnce();
  });

  it('effect re-runs when dependency changes', () => {
    const count = signal(0);
    const fn = vi.fn(() => { count(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    count.set(1);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('effect tracks multiple dependencies', () => {
    const a = signal(1);
    const b = signal(2);
    const fn = vi.fn(() => { a(); b(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    a.set(10);
    expect(fn).toHaveBeenCalledTimes(2);
    b.set(20);
    expect(fn).toHaveBeenCalledTimes(3);
  });

  it('effect does not run when unrelated signal changes', () => {
    const a = signal(1);
    const b = signal(2);
    const fn = vi.fn(() => { a(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    b.set(99);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('computed only recomputes when accessed', () => {
    const count = signal(0);
    const computeFn = vi.fn(() => count() * 2);
    const doubled = computed(computeFn);
    expect(computeFn).not.toHaveBeenCalled();
    doubled();
    expect(computeFn).toHaveBeenCalledOnce();
  });

  it('computed caches value until dependency changes', () => {
    const count = signal(5);
    const computeFn = vi.fn(() => count() + 10);
    const derived = computed(computeFn);
    derived();
    derived();
    derived();
    expect(computeFn).toHaveBeenCalledOnce();
    count.set(10);
    derived();
    expect(computeFn).toHaveBeenCalledTimes(2);
  });

  it('effect.dispose stops tracking', () => {
    const count = signal(0);
    const fn = vi.fn(() => { count(); });
    const eff = effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    eff.dispose();
    count.set(5);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('effect cleanup function runs on re-run', () => {
    const count = signal(0);
    const cleanup = vi.fn();
    effect(() => {
      count();
      return cleanup;
    });
    expect(cleanup).not.toHaveBeenCalled();
    count.set(1);
    expect(cleanup).toHaveBeenCalledOnce();
    count.set(2);
    expect(cleanup).toHaveBeenCalledTimes(2);
  });

  it('effect cleanup runs on dispose', () => {
    const count = signal(0);
    const cleanup = vi.fn();
    const eff = effect(() => {
      count();
      return cleanup;
    });
    eff.dispose();
    expect(cleanup).toHaveBeenCalledOnce();
  });

  it('computed can depend on other computeds', () => {
    const count = signal(2);
    const doubled = computed(() => count() * 2);
    const quadrupled = computed(() => doubled() * 2);
    expect(quadrupled()).toBe(8);
    count.set(5);
    expect(quadrupled()).toBe(20);
  });

  it('effect can read from computed', () => {
    const count = signal(3);
    const doubled = computed(() => count() * 2);
    const fn = vi.fn(() => { doubled(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    count.set(10);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('signal does not trigger if value unchanged', () => {
    const count = signal(5);
    const fn = vi.fn(() => { count(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    count.set(5);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('batch defers updates', () => {
    const a = signal(1);
    const b = signal(2);
    const fn = vi.fn(() => { a(); b(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    batch(() => {
      a.set(10);
      b.set(20);
    });
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('batch prevents multiple effect runs', () => {
    const count = signal(0);
    const fn = vi.fn(() => { count(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    batch(() => {
      count.set(1);
      count.set(2);
      count.set(3);
    });
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('nested batch works correctly', () => {
    const count = signal(0);
    const fn = vi.fn(() => { count(); });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    batch(() => {
      count.set(1);
      batch(() => {
        count.set(2);
      });
      count.set(3);
    });
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('signal.subscribe notifies on change', () => {
    const count = signal(10);
    const listener = vi.fn();
    const unsub = count.subscribe(listener);
    count.set(20);
    expect(listener).toHaveBeenCalledOnce();
    unsub();
    count.set(30);
    expect(listener).toHaveBeenCalledOnce();
  });

  it('complex dependency graph', () => {
    const a = signal(2);
    const b = signal(3);
    const sum = computed(() => a() + b());
    const product = computed(() => a() * b());
    const final = computed(() => sum() + product());
    expect(final()).toBe(11);
    a.set(5);
    expect(final()).toBe(23);
    b.set(4);
    expect(final()).toBe(29);
  });

  it('stress: many signals', () => {
    const signals = Array.from({ length: 100 }, (_, i) => signal(i));
    const sum = computed(() => signals.reduce((acc, s) => acc + s(), 0));
    expect(sum()).toBe(4950);
    signals[50].set(1000);
    expect(sum()).toBe(5900);
  });

  it('stress: deep computed chain', () => {
    const base = signal(1);
    let current = computed(() => base());
    for (let i = 0; i < 20; i++) {
      const prev = current;
      current = computed(() => prev() + 1);
    }
    expect(current()).toBe(21);
    base.set(10);
    expect(current()).toBe(30);
  });

  it('effect with conditional dependency', () => {
    const flag = signal(true);
    const a = signal(1);
    const b = signal(10);
    const fn = vi.fn(() => {
      flag() ? a() : b();
    });
    effect(fn);
    expect(fn).toHaveBeenCalledTimes(1);
    a.set(2);
    expect(fn).toHaveBeenCalledTimes(2);
    b.set(20);
    expect(fn).toHaveBeenCalledTimes(2);
    flag.set(false);
    expect(fn).toHaveBeenCalledTimes(3);
    b.set(30);
    expect(fn).toHaveBeenCalledTimes(4);
    a.set(99);
    expect(fn).toHaveBeenCalledTimes(4);
  });

  it('computed with side effects in getter still caches', () => {
    const count = signal(0);
    const sideEffect = vi.fn();
    const derived = computed(() => {
      sideEffect();
      return count() * 2;
    });
    derived();
    derived();
    expect(sideEffect).toHaveBeenCalledOnce();
  });

  it('multiple effects on same signal', () => {
    const count = signal(0);
    const fn1 = vi.fn(() => { count(); });
    const fn2 = vi.fn(() => { count(); });
    const fn3 = vi.fn(() => { count(); });
    effect(fn1);
    effect(fn2);
    effect(fn3);
    expect(fn1).toHaveBeenCalledOnce();
    expect(fn2).toHaveBeenCalledOnce();
    expect(fn3).toHaveBeenCalledOnce();
    count.set(5);
    expect(fn1).toHaveBeenCalledTimes(2);
    expect(fn2).toHaveBeenCalledTimes(2);
    expect(fn3).toHaveBeenCalledTimes(2);
  });

  it('effect that writes to another signal', () => {
    const a = signal(1);
    const b = signal(0);
    effect(() => {
      b.set(a() * 10);
    });
    expect(b()).toBe(10);
    a.set(5);
    expect(b()).toBe(50);
  });
});
]==],
  },

  {
    name = "Text Search & Highlighting Engine",
    difficulty = "medium",
    stub = [==[
/**
 * Text Search & Highlighting Engine
 *
 * Build a search engine that finds and highlights text patterns in documents.
 * Like Ctrl+F but smarter - support fuzzy matching, case sensitivity, whole words,
 * and highlight overlapping matches correctly.
 *
 * SearchEngine class:
 * - constructor(options?: SearchOptions)
 *   options = { caseSensitive?: boolean, wholeWord?: boolean, fuzzy?: boolean }
 *
 * - search(text: string, query: string): SearchResult[]
 *   Find all matches of query in text. Returns array of { start, end, score }.
 *   For fuzzy search, score indicates match quality (0-100).
 *
 * - highlight(text: string, results: SearchResult[], tag?: string): string
 *   Wrap matches in tags (default: <mark>). Handle overlapping matches by
 *   merging ranges. Return HTML string with highlighted text.
 *
 * - replace(text: string, query: string, replacement: string | ReplaceFn): string
 *   Replace all matches. Replacement can be a string or function(match, index) => string.
 *
 * Fuzzy matching rules:
 * - Characters must appear in order but can skip letters
 * - Score based on: consecutive chars bonus, start-of-word bonus, proximity to query start
 * - Example: "fb" matches "FooBar" (score: 85), "FizBuz" (score: 60), "file_backup" (score: 75)
 *
 * Bonus: Add searchInFiles(files: {name: string, content: string}[], query: string)
 * that returns results grouped by file with context snippets.
 */

export interface SearchOptions {
  caseSensitive?: boolean;
  wholeWord?: boolean;
  fuzzy?: boolean;
  maxDistance?: number;  // For fuzzy: max chars between query letters
}

export interface SearchResult {
  start: number;
  end: number;
  score: number;  // 100 for exact match, lower for fuzzy
}

export interface FileSearchResult {
  file: string;
  matches: Array<{ line: number; text: string; positions: SearchResult[] }>;
}

export type ReplaceFn = (match: string, index: number) => string;

export class SearchEngine {
  constructor(options?: SearchOptions) {
    // YOUR CODE HERE
  }

  search(text: string, query: string): SearchResult[] {
    // YOUR CODE HERE
    return [];
  }

  highlight(text: string, results: SearchResult[], tag: string = 'mark'): string {
    // YOUR CODE HERE
    return text;
  }

  replace(text: string, query: string, replacement: string | ReplaceFn): string {
    // YOUR CODE HERE
    return text;
  }

  /**
   * Bonus: Search across multiple files with context
   */
  searchInFiles(
    files: Array<{ name: string; content: string }>,
    query: string,
    contextLines: number = 1
  ): FileSearchResult[] {
    // YOUR CODE HERE
    return [];
  }
}

/**
 * Bonus: Implement Boyer-Moore string search for fast exact matching
 */
export function boyerMooreSearch(text: string, pattern: string): number[] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { SearchEngine, boyerMooreSearch } from './challenge';

describe('SearchEngine - Exact Match', () => {
  const engine = new SearchEngine({ caseSensitive: false });

  it('finds single occurrence', () => {
    const results = engine.search('hello world', 'world');
    expect(results).toHaveLength(1);
    expect(results[0]).toMatchObject({ start: 6, end: 11, score: 100 });
  });

  it('finds multiple occurrences', () => {
    const results = engine.search('test test test', 'test');
    expect(results).toHaveLength(3);
    expect(results[0].start).toBe(0);
    expect(results[1].start).toBe(5);
    expect(results[2].start).toBe(10);
  });

  it('case insensitive by default', () => {
    const results = engine.search('Hello HELLO hello', 'hello');
    expect(results).toHaveLength(3);
  });

  it('no matches returns empty array', () => {
    expect(engine.search('foo bar', 'baz')).toEqual([]);
  });

  it('empty query returns empty', () => {
    expect(engine.search('text', '')).toEqual([]);
  });
});

describe('SearchEngine - Case Sensitivity', () => {
  it('case sensitive search', () => {
    const engine = new SearchEngine({ caseSensitive: true });
    const results = engine.search('Hello hello HELLO', 'hello');
    expect(results).toHaveLength(1);
    expect(results[0].start).toBe(6);
  });

  it('case sensitive finds exact case only', () => {
    const engine = new SearchEngine({ caseSensitive: true });
    expect(engine.search('Test', 'test')).toHaveLength(0);
    expect(engine.search('test', 'test')).toHaveLength(1);
  });
});

describe('SearchEngine - Whole Word', () => {
  it('whole word matches only complete words', () => {
    const engine = new SearchEngine({ wholeWord: true });
    const results = engine.search('test testing tested', 'test');
    expect(results).toHaveLength(1);
    expect(results[0]).toMatchObject({ start: 0, end: 4 });
  });

  it('whole word respects punctuation boundaries', () => {
    const engine = new SearchEngine({ wholeWord: true });
    const results = engine.search('test, test. test!', 'test');
    expect(results).toHaveLength(3);
  });

  it('whole word at start and end', () => {
    const engine = new SearchEngine({ wholeWord: true });
    expect(engine.search('test in test', 'test')).toHaveLength(2);
  });

  it('whole word does not match substrings', () => {
    const engine = new SearchEngine({ wholeWord: true });
    expect(engine.search('testing', 'test')).toHaveLength(0);
  });
});

describe('SearchEngine - Fuzzy Search', () => {
  const engine = new SearchEngine({ fuzzy: true });

  it('fuzzy matches with skipped chars', () => {
    const results = engine.search('FooBar', 'fb');
    expect(results.length).toBeGreaterThan(0);
    expect(results[0].score).toBeLessThan(100);
    expect(results[0].score).toBeGreaterThan(50);
  });

  it('fuzzy scores consecutive matches higher', () => {
    const r1 = engine.search('foobar', 'fb')[0];
    const r2 = engine.search('foobazr', 'fb')[0];
    expect(r1.score).toBeGreaterThan(r2.score);
  });

  it('fuzzy matches start-of-word bonus', () => {
    const r1 = engine.search('foo_bar', 'fb')[0];
    const r2 = engine.search('fzoobar', 'fb')[0];
    expect(r1.score).toBeGreaterThan(r2.score);
  });

  it('fuzzy requires chars in order', () => {
    expect(engine.search('abc', 'cba')).toHaveLength(0);
  });

  it('fuzzy multiple matches', () => {
    const results = engine.search('FooBar FizzBuzz', 'fb');
    expect(results.length).toBeGreaterThanOrEqual(2);
  });

  it('fuzzy exact match gets perfect score', () => {
    const results = engine.search('test', 'test');
    expect(results[0].score).toBe(100);
  });

  it('fuzzy handles case insensitivity', () => {
    const results = engine.search('FooBar', 'fb');
    expect(results.length).toBeGreaterThan(0);
  });
});

describe('Highlight', () => {
  const engine = new SearchEngine();

  it('wraps single match', () => {
    const results = engine.search('hello world', 'world');
    const highlighted = engine.highlight('hello world', results);
    expect(highlighted).toBe('hello <mark>world</mark>');
  });

  it('wraps multiple matches', () => {
    const results = engine.search('test test', 'test');
    const highlighted = engine.highlight('test test', results);
    expect(highlighted).toBe('<mark>test</mark> <mark>test</mark>');
  });

  it('custom tag', () => {
    const results = engine.search('foo', 'foo');
    const highlighted = engine.highlight('foo', results, 'strong');
    expect(highlighted).toBe('<strong>foo</strong>');
  });

  it('handles overlapping ranges by merging', () => {
    const results = [
      { start: 0, end: 5, score: 100 },
      { start: 3, end: 8, score: 100 },
    ];
    const highlighted = engine.highlight('hello world', results);
    expect(highlighted).toBe('<mark>hello wo</mark>rld');
  });

  it('empty results returns original text', () => {
    expect(engine.highlight('text', [])).toBe('text');
  });

  it('preserves text outside matches', () => {
    const results = engine.search('a b c d e', 'b');
    const highlighted = engine.highlight('a b c d e', results);
    expect(highlighted).toBe('a <mark>b</mark> c d e');
  });
});

describe('Replace', () => {
  const engine = new SearchEngine();

  it('replaces single match', () => {
    const result = engine.replace('hello world', 'world', 'universe');
    expect(result).toBe('hello universe');
  });

  it('replaces all matches', () => {
    const result = engine.replace('test test test', 'test', 'TEST');
    expect(result).toBe('TEST TEST TEST');
  });

  it('replace with function', () => {
    const result = engine.replace('a b c', /\w/g as any, (m, i) => `${i}`);
    expect(result.split(' ').length).toBe(3);
  });

  it('replace function receives match and index', () => {
    const calls: Array<[string, number]> = [];
    engine.replace('x x x', 'x', (m, i) => { calls.push([m, i]); return m; });
    expect(calls).toHaveLength(3);
    expect(calls[0][0]).toBe('x');
    expect(calls[0][1]).toBe(0);
  });

  it('replace with empty string removes matches', () => {
    const result = engine.replace('a b c', ' ', '');
    expect(result).toBe('abc');
  });

  it('no matches returns original', () => {
    expect(engine.replace('foo', 'bar', 'baz')).toBe('foo');
  });
});

describe('File Search', () => {
  const engine = new SearchEngine();
  const files = [
    { name: 'a.txt', content: 'line one\nline two\nline three\nline four' },
    { name: 'b.txt', content: 'first\nsecond\nthird' },
  ];

  it('finds matches across files', () => {
    const results = engine.searchInFiles(files, 'line');
    expect(results).toHaveLength(1);
    expect(results[0].file).toBe('a.txt');
    expect(results[0].matches.length).toBeGreaterThan(0);
  });

  it('includes line numbers', () => {
    const results = engine.searchInFiles(files, 'two');
    expect(results[0].matches[0].line).toBe(2);
  });

  it('provides context lines', () => {
    const results = engine.searchInFiles(files, 'two', 1);
    const match = results[0].matches[0];
    expect(match.text).toContain('two');
  });

  it('groups by file', () => {
    const results = engine.searchInFiles([
      { name: 'x.txt', content: 'test\ntest' },
      { name: 'y.txt', content: 'test' },
    ], 'test');
    expect(results).toHaveLength(2);
  });

  it('no matches returns empty', () => {
    expect(engine.searchInFiles(files, 'xyz')).toEqual([]);
  });
});

describe('Boyer-Moore', () => {
  it('finds all occurrences', () => {
    const positions = boyerMooreSearch('ababcababa', 'aba');
    expect(positions).toEqual([0, 5, 7]);
  });

  it('single occurrence', () => {
    expect(boyerMooreSearch('hello world', 'world')).toEqual([6]);
  });

  it('no match', () => {
    expect(boyerMooreSearch('foo', 'bar')).toEqual([]);
  });

  it('pattern longer than text', () => {
    expect(boyerMooreSearch('hi', 'hello')).toEqual([]);
  });

  it('full text match', () => {
    expect(boyerMooreSearch('test', 'test')).toEqual([0]);
  });

  it('overlapping patterns', () => {
    expect(boyerMooreSearch('aaa', 'aa')).toEqual([0, 1]);
  });

  it('stress: large text', () => {
    const text = 'x'.repeat(10000) + 'needle' + 'x'.repeat(10000);
    const positions = boyerMooreSearch(text, 'needle');
    expect(positions).toEqual([10000]);
  });
});

describe('Integration', () => {
  it('fuzzy search + highlight', () => {
    const engine = new SearchEngine({ fuzzy: true });
    const results = engine.search('FooBar', 'fb');
    const highlighted = engine.highlight('FooBar', results);
    expect(highlighted).toContain('<mark>');
  });

  it('whole word + replace', () => {
    const engine = new SearchEngine({ wholeWord: true });
    const result = engine.replace('test testing tested test', 'test', 'TEST');
    expect(result).toBe('TEST testing tested TEST');
  });

  it('case sensitive + file search', () => {
    const engine = new SearchEngine({ caseSensitive: true });
    const files = [{ name: 'a.txt', content: 'Test\ntest\nTEST' }];
    const results = engine.searchInFiles(files, 'test');
    expect(results[0].matches).toHaveLength(1);
  });

  it('complex multi-file search with context', () => {
    const engine = new SearchEngine();
    const files = [
      { name: 'src/index.ts', content: 'import { foo } from "./foo";\nfoo();\nconsole.log(foo);' },
      { name: 'src/foo.ts', content: 'export function foo() {\n  return 42;\n}' },
    ];
    const results = engine.searchInFiles(files, 'foo', 1);
    expect(results.length).toBeGreaterThan(0);
    expect(results.some(r => r.file.includes('index'))).toBe(true);
  });
});

describe('Edge Cases', () => {
  const engine = new SearchEngine();

  it('unicode characters', () => {
    const results = engine.search('Hello 世界', '世界');
    expect(results).toHaveLength(1);
  });

  it('special regex chars treated literally', () => {
    const results = engine.search('test.file', '.');
    expect(results).toHaveLength(1);
  });

  it('very long query', () => {
    const query = 'a'.repeat(1000);
    expect(engine.search('test', query)).toEqual([]);
  });

  it('empty text', () => {
    expect(engine.search('', 'x')).toEqual([]);
  });

  it('query at start', () => {
    const results = engine.search('hello world', 'hello');
    expect(results[0].start).toBe(0);
  });

  it('query at end', () => {
    const results = engine.search('hello world', 'world');
    expect(results[0].end).toBe(11);
  });
});
]==],
  },
  {
    name = "Pub/Sub Event Bus",
    difficulty = "medium",
    stub = [==[
/**
 * Pub/Sub Event Bus
 *
 * Implement a type-safe publish-subscribe event bus with wildcard support.
 *
 * EventBus class:
 * - subscribe(pattern: string, handler: (data: any) => void): () => void
 *   Subscribe to events matching a pattern. Returns an unsubscribe function.
 *   Patterns support wildcards:
 *     - 'user.login' — exact match
 *     - 'user.*' — matches user.login, user.logout, etc.
 *     - '*' — matches all events
 *
 * - publish(event: string, data?: any): number
 *   Publish an event with optional data. Returns the number of handlers called.
 *
 * - once(pattern: string, handler: (data: any) => void): () => void
 *   Subscribe, but auto-unsubscribe after the first matching event.
 *
 * - clear(pattern?: string): void
 *   Remove all subscribers. If pattern provided, only remove matching subscribers.
 *
 * - listenerCount(pattern: string): number
 *   Count active listeners for a pattern.
 *
 * Bonus: Implement async event handlers with publishAsync that waits for all handlers
 * and returns Promise<void>.
 */

type EventHandler = (data?: any) => void;

export class EventBus {
  constructor() {
    // YOUR CODE HERE
  }

  subscribe(pattern: string, handler: EventHandler): () => void {
    // YOUR CODE HERE
    return () => {};
  }

  publish(event: string, data?: any): number {
    // YOUR CODE HERE
    return 0;
  }

  once(pattern: string, handler: EventHandler): () => void {
    // YOUR CODE HERE
    return () => {};
  }

  clear(pattern?: string): void {
    // YOUR CODE HERE
  }

  listenerCount(pattern: string): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Async version that waits for all handlers to complete.
   * Handlers can return void or Promise<void>.
   */
  async publishAsync(event: string, data?: any): Promise<void> {
    // YOUR CODE HERE
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { EventBus } from './challenge';

describe('EventBus', () => {
  it('subscribe and publish exact match', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('user.login', handler);
    const count = bus.publish('user.login', { userId: 1 });
    expect(count).toBe(1);
    expect(handler).toHaveBeenCalledWith({ userId: 1 });
  });

  it('no match does not call handler', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('user.login', handler);
    bus.publish('user.logout');
    expect(handler).not.toHaveBeenCalled();
  });

  it('wildcard pattern matches multiple events', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('user.*', handler);
    bus.publish('user.login');
    bus.publish('user.logout');
    bus.publish('order.created');
    expect(handler).toHaveBeenCalledTimes(2);
  });

  it('global wildcard matches all events', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('*', handler);
    bus.publish('anything');
    bus.publish('something.else');
    expect(handler).toHaveBeenCalledTimes(2);
  });

  it('multiple subscribers for same event', () => {
    const bus = new EventBus();
    const h1 = vi.fn();
    const h2 = vi.fn();
    bus.subscribe('test', h1);
    bus.subscribe('test', h2);
    const count = bus.publish('test', 42);
    expect(count).toBe(2);
    expect(h1).toHaveBeenCalledWith(42);
    expect(h2).toHaveBeenCalledWith(42);
  });

  it('unsubscribe removes handler', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    const unsub = bus.subscribe('test', handler);
    bus.publish('test');
    unsub();
    bus.publish('test');
    expect(handler).toHaveBeenCalledOnce();
  });

  it('once fires only once', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.once('event', handler);
    bus.publish('event');
    bus.publish('event');
    expect(handler).toHaveBeenCalledOnce();
  });

  it('once with wildcard', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.once('user.*', handler);
    bus.publish('user.login');
    bus.publish('user.logout');
    expect(handler).toHaveBeenCalledOnce();
  });

  it('once unsubscribe before event', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    const unsub = bus.once('event', handler);
    unsub();
    bus.publish('event');
    expect(handler).not.toHaveBeenCalled();
  });

  it('clear removes all subscribers', () => {
    const bus = new EventBus();
    const h1 = vi.fn();
    const h2 = vi.fn();
    bus.subscribe('a', h1);
    bus.subscribe('b', h2);
    bus.clear();
    bus.publish('a');
    bus.publish('b');
    expect(h1).not.toHaveBeenCalled();
    expect(h2).not.toHaveBeenCalled();
  });

  it('clear with pattern removes matching only', () => {
    const bus = new EventBus();
    const h1 = vi.fn();
    const h2 = vi.fn();
    bus.subscribe('user.login', h1);
    bus.subscribe('order.created', h2);
    bus.clear('user.*');
    bus.publish('user.login');
    bus.publish('order.created');
    expect(h1).not.toHaveBeenCalled();
    expect(h2).toHaveBeenCalled();
  });

  it('listenerCount returns correct count', () => {
    const bus = new EventBus();
    bus.subscribe('test', () => {});
    bus.subscribe('test', () => {});
    bus.subscribe('other', () => {});
    expect(bus.listenerCount('test')).toBe(2);
    expect(bus.listenerCount('other')).toBe(1);
  });

  it('listenerCount with wildcard', () => {
    const bus = new EventBus();
    bus.subscribe('user.login', () => {});
    bus.subscribe('user.logout', () => {});
    bus.subscribe('order.created', () => {});
    expect(bus.listenerCount('user.*')).toBe(2);
  });

  it('publish returns 0 when no listeners', () => {
    const bus = new EventBus();
    expect(bus.publish('nothing')).toBe(0);
  });

  it('publish with no data', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('event', handler);
    bus.publish('event');
    expect(handler).toHaveBeenCalledWith(undefined);
  });

  it('different patterns are independent', () => {
    const bus = new EventBus();
    const h1 = vi.fn();
    const h2 = vi.fn();
    bus.subscribe('a.*', h1);
    bus.subscribe('b.*', h2);
    bus.publish('a.1');
    bus.publish('b.2');
    expect(h1).toHaveBeenCalledOnce();
    expect(h2).toHaveBeenCalledOnce();
  });

  it('nested wildcards', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('app.*.event', handler);
    bus.publish('app.user.event');
    bus.publish('app.order.event');
    bus.publish('app.event');
    expect(handler).toHaveBeenCalledTimes(2);
  });

  it('exact match takes priority', () => {
    const bus = new EventBus();
    const exact = vi.fn();
    const wildcard = vi.fn();
    bus.subscribe('user.login', exact);
    bus.subscribe('user.*', wildcard);
    bus.publish('user.login');
    expect(exact).toHaveBeenCalled();
    expect(wildcard).toHaveBeenCalled();
  });

  it('stress: many subscribers', () => {
    const bus = new EventBus();
    const handlers = Array.from({ length: 100 }, () => vi.fn());
    handlers.forEach(h => bus.subscribe('event', h));
    const count = bus.publish('event', 'data');
    expect(count).toBe(100);
    handlers.forEach(h => expect(h).toHaveBeenCalledWith('data'));
  });

  it('stress: many events', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('*', handler);
    for (let i = 0; i < 500; i++) {
      bus.publish(`event.${i}`);
    }
    expect(handler).toHaveBeenCalledTimes(500);
  });

  it('publishAsync waits for all handlers', async () => {
    const bus = new EventBus();
    const order: number[] = [];
    bus.subscribe('test', async () => {
      await new Promise(r => setTimeout(r, 20));
      order.push(1);
    });
    bus.subscribe('test', async () => {
      await new Promise(r => setTimeout(r, 10));
      order.push(2);
    });
    await bus.publishAsync('test');
    expect(order).toEqual([2, 1]);
  });

  it('publishAsync with sync handlers', async () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('test', handler);
    await bus.publishAsync('test', 'data');
    expect(handler).toHaveBeenCalledWith('data');
  });

  it('publishAsync with no listeners', async () => {
    const bus = new EventBus();
    await expect(bus.publishAsync('nothing')).resolves.toBeUndefined();
  });

  it('error in handler does not stop others', () => {
    const bus = new EventBus();
    const h1 = vi.fn(() => { throw new Error('boom'); });
    const h2 = vi.fn();
    bus.subscribe('test', h1);
    bus.subscribe('test', h2);
    expect(() => bus.publish('test')).not.toThrow();
    expect(h2).toHaveBeenCalled();
  });

  it('same handler subscribed multiple times', () => {
    const bus = new EventBus();
    const handler = vi.fn();
    bus.subscribe('test', handler);
    bus.subscribe('test', handler);
    bus.publish('test');
    expect(handler).toHaveBeenCalledTimes(2);
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
  {
    name = "Sorted Set (Redis-style)",
    difficulty = "hard",
    stub = [==[
/**
 * Sorted Set (Redis-style)
 *
 * Implement a sorted set data structure similar to Redis ZSET.
 * Elements are unique strings with numeric scores. The set is sorted by score,
 * with ties broken by lexicographic order of the element.
 *
 * SortedSet class:
 * - add(member: string, score: number): boolean
 *   Add or update a member with a score. Returns true if new member, false if update.
 *
 * - remove(member: string): boolean
 *   Remove a member. Returns true if it existed, false otherwise.
 *
 * - score(member: string): number | null
 *   Get the score of a member, or null if not found.
 *
 * - rank(member: string): number | null
 *   Get the 0-based rank (position in sorted order), or null if not found.
 *
 * - range(start: number, stop: number): string[]
 *   Get members by rank range [start, stop] (0-indexed, inclusive).
 *   Negative indices count from the end (-1 = last element).
 *
 * - rangeByScore(min: number, max: number, limit?: number): string[]
 *   Get members with scores in [min, max], limited to `limit` results.
 *
 * - count(): number
 *   Total number of members.
 *
 * Bonus: Implement incrementBy(member, delta) and removeRangeByScore(min, max).
 *
 * Implementation notes:
 * - Maintain O(log n) add/remove using a balanced tree or skip list approach
 * - For simplicity, you may use an array + binary search (O(n) inserts but easier)
 * - Real Redis uses a skip list + hash map hybrid
 */

export class SortedSet {
  constructor() {
    // YOUR CODE HERE
  }

  add(member: string, score: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  remove(member: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  score(member: string): number | null {
    // YOUR CODE HERE
    return null;
  }

  rank(member: string): number | null {
    // YOUR CODE HERE
    return null;
  }

  range(start: number, stop: number): string[] {
    // YOUR CODE HERE
    return [];
  }

  rangeByScore(min: number, max: number, limit?: number): string[] {
    // YOUR CODE HERE
    return [];
  }

  count(): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Increment a member's score by delta.
   * If member doesn't exist, treat initial score as 0.
   */
  incrementBy(member: string, delta: number): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Remove all members with scores in [min, max].
   * Returns the count of removed members.
   */
  removeRangeByScore(min: number, max: number): number {
    // YOUR CODE HERE
    return 0;
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { SortedSet } from './challenge';

describe('SortedSet', () => {
  it('add new member returns true', () => {
    const zset = new SortedSet();
    expect(zset.add('alice', 100)).toBe(true);
    expect(zset.count()).toBe(1);
  });

  it('update existing member returns false', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    expect(zset.add('alice', 200)).toBe(false);
    expect(zset.count()).toBe(1);
  });

  it('score returns correct value', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    expect(zset.score('alice')).toBe(100);
  });

  it('score returns null for missing member', () => {
    const zset = new SortedSet();
    expect(zset.score('nobody')).toBe(null);
  });

  it('remove existing member returns true', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    expect(zset.remove('alice')).toBe(true);
    expect(zset.count()).toBe(0);
  });

  it('remove non-existent member returns false', () => {
    const zset = new SortedSet();
    expect(zset.remove('nobody')).toBe(false);
  });

  it('rank returns position in sorted order', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    zset.add('bob', 200);
    zset.add('charlie', 150);
    expect(zset.rank('alice')).toBe(0);
    expect(zset.rank('charlie')).toBe(1);
    expect(zset.rank('bob')).toBe(2);
  });

  it('rank returns null for missing member', () => {
    const zset = new SortedSet();
    expect(zset.rank('nobody')).toBe(null);
  });

  it('range returns members in order', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    zset.add('bob', 200);
    zset.add('charlie', 150);
    expect(zset.range(0, 2)).toEqual(['alice', 'charlie', 'bob']);
  });

  it('range with negative indices', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    zset.add('b', 2);
    zset.add('c', 3);
    expect(zset.range(-2, -1)).toEqual(['b', 'c']);
  });

  it('range subset', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    zset.add('b', 2);
    zset.add('c', 3);
    zset.add('d', 4);
    expect(zset.range(1, 2)).toEqual(['b', 'c']);
  });

  it('rangeByScore returns members within score range', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    zset.add('bob', 200);
    zset.add('charlie', 150);
    zset.add('dave', 175);
    expect(zset.rangeByScore(100, 175)).toEqual(['alice', 'charlie', 'dave']);
  });

  it('rangeByScore with limit', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    zset.add('b', 2);
    zset.add('c', 3);
    zset.add('d', 4);
    expect(zset.rangeByScore(1, 10, 2)).toEqual(['a', 'b']);
  });

  it('rangeByScore no matches', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    expect(zset.rangeByScore(10, 20)).toEqual([]);
  });

  it('lexicographic tie-breaking', () => {
    const zset = new SortedSet();
    zset.add('zebra', 100);
    zset.add('apple', 100);
    zset.add('banana', 100);
    expect(zset.range(0, 2)).toEqual(['apple', 'banana', 'zebra']);
  });

  it('update changes rank', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    zset.add('bob', 200);
    expect(zset.rank('alice')).toBe(0);
    zset.add('alice', 300);
    expect(zset.rank('alice')).toBe(1);
  });

  it('count reflects current size', () => {
    const zset = new SortedSet();
    expect(zset.count()).toBe(0);
    zset.add('a', 1);
    zset.add('b', 2);
    expect(zset.count()).toBe(2);
    zset.remove('a');
    expect(zset.count()).toBe(1);
  });

  it('empty range', () => {
    const zset = new SortedSet();
    expect(zset.range(0, 10)).toEqual([]);
  });

  it('range out of bounds', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    expect(zset.range(10, 20)).toEqual([]);
  });

  it('incrementBy on new member', () => {
    const zset = new SortedSet();
    const newScore = zset.incrementBy('alice', 50);
    expect(newScore).toBe(50);
    expect(zset.score('alice')).toBe(50);
  });

  it('incrementBy on existing member', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    const newScore = zset.incrementBy('alice', 25);
    expect(newScore).toBe(125);
    expect(zset.score('alice')).toBe(125);
  });

  it('incrementBy negative delta', () => {
    const zset = new SortedSet();
    zset.add('alice', 100);
    const newScore = zset.incrementBy('alice', -30);
    expect(newScore).toBe(70);
  });

  it('removeRangeByScore removes matching members', () => {
    const zset = new SortedSet();
    zset.add('a', 10);
    zset.add('b', 20);
    zset.add('c', 30);
    zset.add('d', 40);
    const removed = zset.removeRangeByScore(20, 30);
    expect(removed).toBe(2);
    expect(zset.count()).toBe(2);
    expect(zset.range(0, -1)).toEqual(['a', 'd']);
  });

  it('removeRangeByScore no matches', () => {
    const zset = new SortedSet();
    zset.add('a', 10);
    expect(zset.removeRangeByScore(50, 100)).toBe(0);
    expect(zset.count()).toBe(1);
  });

  it('stress: many members', () => {
    const zset = new SortedSet();
    for (let i = 0; i < 1000; i++) {
      zset.add(`user${i}`, Math.random() * 1000);
    }
    expect(zset.count()).toBe(1000);
    const top10 = zset.range(0, 9);
    expect(top10.length).toBe(10);
  });

  it('stress: repeated updates', () => {
    const zset = new SortedSet();
    zset.add('player', 0);
    for (let i = 0; i < 100; i++) {
      zset.incrementBy('player', 1);
    }
    expect(zset.score('player')).toBe(100);
  });

  it('range clamps correctly', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    zset.add('b', 2);
    zset.add('c', 3);
    expect(zset.range(-100, 100)).toEqual(['a', 'b', 'c']);
  });

  it('identical scores with many members', () => {
    const zset = new SortedSet();
    const names = ['zoe', 'alice', 'charlie', 'bob'];
    names.forEach(n => zset.add(n, 100));
    expect(zset.range(0, -1)).toEqual(['alice', 'bob', 'charlie', 'zoe']);
  });

  it('score boundary inclusion', () => {
    const zset = new SortedSet();
    zset.add('a', 10);
    zset.add('b', 20);
    zset.add('c', 30);
    expect(zset.rangeByScore(10, 20)).toEqual(['a', 'b']);
    expect(zset.rangeByScore(15, 25)).toEqual(['b']);
  });

  it('negative scores', () => {
    const zset = new SortedSet();
    zset.add('a', -10);
    zset.add('b', 0);
    zset.add('c', 10);
    expect(zset.range(0, 2)).toEqual(['a', 'b', 'c']);
    expect(zset.rangeByScore(-5, 5)).toEqual(['b']);
  });

  it('decimal scores', () => {
    const zset = new SortedSet();
    zset.add('a', 1.5);
    zset.add('b', 1.7);
    zset.add('c', 1.3);
    expect(zset.range(0, -1)).toEqual(['c', 'a', 'b']);
  });

  it('remove updates ranks correctly', () => {
    const zset = new SortedSet();
    zset.add('a', 1);
    zset.add('b', 2);
    zset.add('c', 3);
    zset.remove('b');
    expect(zset.rank('a')).toBe(0);
    expect(zset.rank('c')).toBe(1);
  });

  it('empty set operations', () => {
    const zset = new SortedSet();
    expect(zset.count()).toBe(0);
    expect(zset.range(0, 10)).toEqual([]);
    expect(zset.rangeByScore(0, 100)).toEqual([]);
    expect(zset.rank('any')).toBe(null);
    expect(zset.score('any')).toBe(null);
  });

  it('single member operations', () => {
    const zset = new SortedSet();
    zset.add('solo', 42);
    expect(zset.rank('solo')).toBe(0);
    expect(zset.range(0, 0)).toEqual(['solo']);
    expect(zset.rangeByScore(40, 50)).toEqual(['solo']);
  });
});
]==],
  {
    name = "Concurrent Task Pool with Priority",
    difficulty = "medium",
    stub = [==[
/**
 * Concurrent Task Pool with Priority
 *
 * Implement a task pool that manages concurrent execution with priority queuing.
 * Like Promise.all but with concurrency limits and priority scheduling.
 *
 * TaskPool class:
 * - constructor(concurrency: number)
 *   Maximum number of tasks that can run simultaneously
 *
 * - add<T>(task: () => Promise<T>, priority?: number): Promise<T>
 *   Add a task to the pool. Returns a promise that resolves with the task result.
 *   Higher priority tasks run first (default: 0). Same priority → FIFO order.
 *
 * - size(): number
 *   Current number of running + queued tasks
 *
 * - drain(): Promise<void>
 *   Wait for all queued and running tasks to complete
 *
 * - pause(): void
 *   Stop starting new tasks (running tasks continue)
 *
 * - resume(): void
 *   Resume starting new tasks from the queue
 *
 * - clear(): void
 *   Cancel all queued tasks (running tasks continue)
 *
 * - get running(): number
 *   Count of currently executing tasks
 *
 * - get queued(): number
 *   Count of tasks waiting in the queue
 *
 * Bonus: Add retry logic with exponential backoff:
 *   - addWithRetry(task, options: { retries: number, backoffMs: number })
 */

export class TaskPool {
  constructor(concurrency: number) {
    // YOUR CODE HERE
  }

  add<T>(task: () => Promise<T>, priority?: number): Promise<T> {
    // YOUR CODE HERE
    return Promise.reject(new Error('Not implemented'));
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  drain(): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }

  pause(): void {
    // YOUR CODE HERE
  }

  resume(): void {
    // YOUR CODE HERE
  }

  clear(): void {
    // YOUR CODE HERE
  }

  get running(): number {
    // YOUR CODE HERE
    return 0;
  }

  get queued(): number {
    // YOUR CODE HERE
    return 0;
  }

  /**
   * Bonus: Add task with automatic retry on failure
   */
  addWithRetry<T>(
    task: () => Promise<T>,
    options: { retries: number; backoffMs: number; priority?: number }
  ): Promise<T> {
    // YOUR CODE HERE
    return Promise.reject(new Error('Not implemented'));
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi } from 'vitest';
import { TaskPool } from './challenge';

const delay = (ms: number) => new Promise(r => setTimeout(r, ms));

describe('TaskPool', () => {
  it('runs tasks up to concurrency limit', async () => {
    const pool = new TaskPool(2);
    let running = 0;
    let maxRunning = 0;

    const makeTask = () => async () => {
      running++;
      maxRunning = Math.max(maxRunning, running);
      await delay(20);
      running--;
    };

    await Promise.all([
      pool.add(makeTask()),
      pool.add(makeTask()),
      pool.add(makeTask()),
      pool.add(makeTask()),
    ]);

    expect(maxRunning).toBe(2);
  });

  it('returns task result', async () => {
    const pool = new TaskPool(2);
    const result = await pool.add(async () => 42);
    expect(result).toBe(42);
  });

  it('propagates task errors', async () => {
    const pool = new TaskPool(2);
    await expect(pool.add(async () => {
      throw new Error('task failed');
    })).rejects.toThrow('task failed');
  });

  it('priority tasks run before lower priority', async () => {
    const pool = new TaskPool(1);
    const order: string[] = [];

    // Block pool with long task
    const blocker = pool.add(async () => {
      await delay(50);
      order.push('blocker');
    });

    // Queue tasks with different priorities
    await delay(5); // Ensure blocker is running
    const low = pool.add(async () => { order.push('low'); }, 0);
    const high = pool.add(async () => { order.push('high'); }, 10);
    const medium = pool.add(async () => { order.push('medium'); }, 5);

    await Promise.all([blocker, low, high, medium]);
    expect(order).toEqual(['blocker', 'high', 'medium', 'low']);
  });

  it('same priority maintains FIFO order', async () => {
    const pool = new TaskPool(1);
    const order: number[] = [];

    const blocker = pool.add(async () => { await delay(20); });
    await delay(5);

    const tasks = [1, 2, 3, 4].map(i =>
      pool.add(async () => { order.push(i); }, 5)
    );

    await blocker;
    await Promise.all(tasks);
    expect(order).toEqual([1, 2, 3, 4]);
  });

  it('size returns total tasks', async () => {
    const pool = new TaskPool(1);
    let resolve1: () => void;
    const task1 = new Promise<void>(r => { resolve1 = r; });

    pool.add(async () => { await task1; });
    pool.add(async () => {});
    pool.add(async () => {});

    await delay(5);
    expect(pool.size()).toBe(3);

    resolve1!();
    await delay(5);
    expect(pool.size()).toBeLessThan(3);
  });

  it('running and queued counts', async () => {
    const pool = new TaskPool(2);
    let resolve: () => void;
    const blocker = new Promise<void>(r => { resolve = r; });

    pool.add(async () => { await blocker; });
    pool.add(async () => { await blocker; });
    pool.add(async () => {});
    pool.add(async () => {});

    await delay(10);
    expect(pool.running).toBe(2);
    expect(pool.queued).toBe(2);

    resolve!();
    await delay(10);
    expect(pool.running).toBe(0);
    expect(pool.queued).toBe(0);
  });

  it('drain waits for all tasks', async () => {
    const pool = new TaskPool(2);
    const completed: number[] = [];

    pool.add(async () => { await delay(30); completed.push(1); });
    pool.add(async () => { await delay(20); completed.push(2); });
    pool.add(async () => { await delay(10); completed.push(3); });

    await pool.drain();
    expect(completed.sort()).toEqual([1, 2, 3]);
  });

  it('pause stops starting new tasks', async () => {
    const pool = new TaskPool(1);
    const started: string[] = [];

    pool.add(async () => {
      started.push('first');
      await delay(20);
    });

    await delay(5);
    pool.pause();

    pool.add(async () => { started.push('second'); });

    await delay(50);
    expect(started).toEqual(['first']);
  });

  it('resume restarts queue processing', async () => {
    const pool = new TaskPool(1);
    const completed: string[] = [];

    pool.add(async () => { await delay(10); completed.push('first'); });
    await delay(5);
    pool.pause();

    const second = pool.add(async () => { completed.push('second'); });

    await delay(30);
    expect(completed).toEqual(['first']);

    pool.resume();
    await second;
    expect(completed).toEqual(['first', 'second']);
  });

  it('clear removes queued tasks', async () => {
    const pool = new TaskPool(1);
    const executed: number[] = [];

    const running = pool.add(async () => {
      await delay(30);
      executed.push(1);
    });

    await delay(5);
    pool.add(async () => { executed.push(2); });
    pool.add(async () => { executed.push(3); });

    pool.clear();
    await running;
    await delay(50);

    expect(executed).toEqual([1]);
  });

  it('clear rejects pending promises', async () => {
    const pool = new TaskPool(1);

    pool.add(async () => { await delay(20); });
    await delay(5);

    const pending = pool.add(async () => 'result');
    pool.clear();

    await expect(pending).rejects.toThrow();
  });

  it('handles task that throws immediately', async () => {
    const pool = new TaskPool(2);
    await expect(pool.add(async () => {
      throw new Error('immediate');
    })).rejects.toThrow('immediate');
  });

  it('continues after task error', async () => {
    const pool = new TaskPool(1);
    const results: (string | Error)[] = [];

    const p1 = pool.add(async () => { throw new Error('fail'); })
      .catch(e => { results.push(e as Error); });
    const p2 = pool.add(async () => { results.push('success'); });

    await Promise.all([p1, p2]);
    expect(results[0]).toBeInstanceOf(Error);
    expect(results[1]).toBe('success');
  });

  it('zero concurrency throws', () => {
    expect(() => new TaskPool(0)).toThrow();
  });

  it('negative concurrency throws', () => {
    expect(() => new TaskPool(-1)).toThrow();
  });

  it('stress: many tasks', async () => {
    const pool = new TaskPool(10);
    const tasks = Array.from({ length: 500 }, (_, i) =>
      pool.add(async () => i)
    );
    const results = await Promise.all(tasks);
    expect(results).toHaveLength(500);
    expect(results[250]).toBe(250);
  });

  it('stress: high priority surge', async () => {
    const pool = new TaskPool(2);
    const order: number[] = [];

    const blocker = pool.add(async () => { await delay(50); });

    await delay(5);
    for (let i = 0; i < 20; i++) {
      pool.add(async () => { order.push(i); }, i % 2 === 0 ? 10 : 1);
    }

    await pool.drain();
    // First 10 should be high priority (even indices)
    const first10 = order.slice(0, 10);
    const allEven = first10.every(n => n % 2 === 0);
    expect(allEven).toBe(true);
  });

  it('addWithRetry succeeds after failures', async () => {
    const pool = new TaskPool(1);
    let attempts = 0;

    const result = await pool.addWithRetry(
      async () => {
        attempts++;
        if (attempts < 3) throw new Error('retry me');
        return 'success';
      },
      { retries: 3, backoffMs: 10 }
    );

    expect(result).toBe('success');
    expect(attempts).toBe(3);
  });

  it('addWithRetry fails after max retries', async () => {
    const pool = new TaskPool(1);
    let attempts = 0;

    await expect(pool.addWithRetry(
      async () => {
        attempts++;
        throw new Error('always fails');
      },
      { retries: 2, backoffMs: 5 }
    )).rejects.toThrow('always fails');

    expect(attempts).toBe(3); // initial + 2 retries
  });

  it('addWithRetry respects backoff timing', async () => {
    const pool = new TaskPool(1);
    const timestamps: number[] = [];

    await pool.addWithRetry(
      async () => {
        timestamps.push(Date.now());
        if (timestamps.length < 3) throw new Error('retry');
        return 'done';
      },
      { retries: 3, backoffMs: 50 }
    ).catch(() => {});

    // First retry after ~50ms, second after ~100ms (exponential)
    const gaps = timestamps.slice(1).map((t, i) => t - timestamps[i]);
    expect(gaps[0]).toBeGreaterThanOrEqual(40);
    expect(gaps[1]).toBeGreaterThanOrEqual(90);
  });

  it('addWithRetry with priority', async () => {
    const pool = new TaskPool(1);
    const order: string[] = [];

    const blocker = pool.add(async () => { await delay(30); });

    await delay(5);
    const low = pool.addWithRetry(
      async () => { order.push('low'); },
      { retries: 0, backoffMs: 10, priority: 1 }
    );
    const high = pool.addWithRetry(
      async () => { order.push('high'); },
      { retries: 0, backoffMs: 10, priority: 10 }
    );

    await Promise.all([blocker, low, high]);
    expect(order).toEqual(['high', 'low']);
  });

  it('drain after pause waits correctly', async () => {
    const pool = new TaskPool(2);
    const completed: number[] = [];

    pool.add(async () => { await delay(30); completed.push(1); });
    pool.pause();

    pool.add(async () => { await delay(10); completed.push(2); });

    // Drain should wait even though queue is paused
    const drainPromise = pool.drain();
    await delay(50);
    expect(completed).toEqual([1]);

    pool.resume();
    await drainPromise;
    expect(completed.sort()).toEqual([1, 2]);
  });

  it('concurrent concurrency changes', async () => {
    const pool = new TaskPool(5);
    const running: number[] = [];

    const tasks = Array.from({ length: 20 }, (_, i) =>
      pool.add(async () => {
        running.push(i);
        await delay(50);
        running.splice(running.indexOf(i), 1);
      })
    );

    await delay(10);
    expect(pool.running).toBeLessThanOrEqual(5);

    await Promise.all(tasks);
    expect(pool.running).toBe(0);
  });
});
]==],
  },
}
