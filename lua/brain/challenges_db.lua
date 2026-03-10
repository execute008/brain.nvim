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
}

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
}

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
}

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
}

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
}

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
