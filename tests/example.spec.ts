import { test, expect } from '@playwright/test';


test('hello world!', async ({ page }) => {
    await page.goto('http://127.0.0.1:3000/en');
    const title = await page.title();
    expect(title).toBe('View your documents');
});

test('should display sign-in or sign-out button', async ({ page }) => {
    await page.goto('http://127.0.0.1:3000/en');

    // Check for "Sign in" button when not signed in
    const signInButton = page.locator('text=Sign in');
    await expect(signInButton).toBeVisible();
});

test('should navigate to upload page when clicking upload link', async ({ page }) => {
    // Go to the login page
    await page.goto('http://127.0.0.1:3000/users/sign_in');

    // Fill in the login form
    await page.fill('input[name="user[email]"]', 'playwright@test.com');
    await page.fill('input[name="user[password]"]', 'playwrighttest');

    // Submit the form by clicking the login button and wait for navigation
    await Promise.all([
        page.waitForNavigation(), // Wait for navigation

         await page.getByRole('button', { name: 'Sign in' }).click()
    ]);

    await expect(page.locator('text=Sign out')).toBeVisible();


    // Locate the upload link
    const uploadLink = page.locator('text=Upload your documents.');

    // Ensure the link is visible
    await expect(page.locator('text=Upload your documents.')).toBeVisible();

    // Click the upload link and wait for navigation
    await Promise.all([
        page.waitForNavigation(), // Wait for navigation
        uploadLink.click(),       // Trigger navigation
    ]);

    // Verify navigation to the upload page
    await expect(page).toHaveURL('http://127.0.0.1:3000/en/visa_documents/new');
});

import path from 'path';

test('Upload a single file', async ({ page }) => {
  await page.goto('http://127.0.0.1:3000/users/sign_in');

  // Fill in the login form
  await page.fill('input[name="user[email]"]', 'playwright@test.com');
  await page.fill('input[name="user[password]"]', 'playwrighttest');

  // Submit the form by clicking the login button and wait for navigation
  await Promise.all([
    page.waitForNavigation(),
    page.getByRole('button', { name: 'Sign in' }).click()
  ]);

  await page.goto('http://127.0.0.1:3000/en/visa_documents/97/edit');

  // Select the file input by its type
  const fileInput = page.locator('input[name="visa_document[visa_application_payment]"]');

  // Upload the file
  const filePath = path.resolve('tests', 'assets', 'ACRO.csv');
  console.log(filePath);
  await expect(fileInput).toBeVisible();
  await fileInput.setInputFiles(filePath);
  const uploadedFiles = await fileInput.evaluate(input => input.files?.[0]?.name);
  console.log(uploadedFiles); // Should log "ACRO.csv"

  // Submit the form
  await page.locator('text=Update document').click();

  // Assert that the upload was successful
  await expect(page).toHaveURL('http://127.0.0.1:3000/en');

    // Check for a success message or any indication of successful upload
   expect(page.locator('text=ACRO.csv')).toBeVisible();

   await page.locator('text=Download').click();

   expect(page.locator('text=ACRO.csv')).toBeVisible()

   await page.goto('http://127.0.0.1:3000/en');
});

test('should download a file when clicking download link', async ({ page }) => {

    await page.goto('http://127.0.0.1:3000/users/sign_in');

    // Fill in the login form
    await page.fill('input[name="user[email]"]', 'playwright@test.com');
    await page.fill('input[name="user[password]"]', 'playwrighttest');

    await Promise.all([
        page.waitForNavigation(),
        page.getByRole('button', { name: 'Sign in' }).click()
      ]);

    await page.goto('http://127.0.0.1:3000/en');

    await page.locator('text=Download').click();

    expect(page.locator('text=ACRO.csv')).toBeVisible()

    await page.goto('http://127.0.0.1:3000/en');

});