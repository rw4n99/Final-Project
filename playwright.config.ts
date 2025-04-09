import { defineConfig } from '@playwright/test';

export default defineConfig({
  timeout: 30000,
  use: {
    headless: true,
    browserName: 'chromium',
    launchOptions: {
      slowMo: 1000
  },},
  testDir: 'tests',
});