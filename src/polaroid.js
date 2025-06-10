#!/usr/bin/env node

import { spawn } from 'child_process';
import { createProgram } from './program.js';
import { createPolaroidOptions } from './polaroidOptions.js';

const { photo, polaroid } = createProgram();

const opts = createPolaroidOptions(photo, polaroid); 

const im = spawn('convert', opts);
im.stderr.on('data', (data) => {
    console.log(`stderr: ${data}`);
});

im.on('close', (code) => {
    console.log(`child process exited with code ${code}`);
});