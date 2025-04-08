import { defineConfig } from '@playwright/test';

export default defineConfig({
  timeout: 30000,
  use: {
    headless: true,
    browserName: 'chromium',
  },
  testDir: 'tests',
});