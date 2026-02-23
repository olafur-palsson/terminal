#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const value = parseInt(process.argv[2], 10);

if (isNaN(value)) {
  console.error('Usage: op <numeric-value>');
  process.exit(1);
}

// Walk up to git root
function findGitRoot(dir) {
  if (fs.existsSync(path.join(dir, '.git'))) return dir;
  const parent = path.dirname(dir);
  if (parent === dir) { console.error('Not in a git repo'); process.exit(1); }
  return findGitRoot(parent);
}

const gitRoot = findGitRoot(process.cwd());

// Find Enums.cs
function findFile(dir, name) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name === name) return path.join(dir, entry.name);
    if (entry.isDirectory() && entry.name !== 'node_modules' && entry.name !== '.git') {
      const found = findFile(path.join(dir, entry.name), name);
      if (found) return found;
    }
  }
  return null;
}

const enumsPath = findFile(gitRoot, 'Enums.cs');
if (!enumsPath) { console.error('Enums.cs not found'); process.exit(1); }

const src = fs.readFileSync(enumsPath, 'utf8');

// Extract DataOperation enum block
const match = src.match(/enum\s+DataOperation\s*\{([^}]*)\}/s);
if (!match) { console.error('DataOperation enum not found in Enums.cs'); process.exit(1); }

const block = match[1];
let current = 0;
for (const line of block.split('\n')) {
  const trimmed = line.trim().replace(/,$/, '');
  if (!trimmed || trimmed.startsWith('//')) continue;
  const assign = trimmed.match(/^(\w+)\s*=\s*(-?\d+)/);
  if (assign) {
    current = parseInt(assign[2], 10);
    if (current === value) { console.log(assign[1]); process.exit(0); }
  } else {
    const name = trimmed.match(/^(\w+)/)?.[1];
    if (name) {
      if (current === value) { console.log(name); process.exit(0); }
      current++;
    }
  }
}

console.error(`Value ${value} not found in DataOperation`);
process.exit(1);
