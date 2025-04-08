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

    // Simulate signed-in state (if possible, mock authentication)
    // Check for "Sign out" button
    // const signOutButton = page.locator('text=Sign out');
    // await expect(signOutButton).toBeVisible();
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

// test('should download a file when clicking download link', async ({ page }) => {

//     await page.goto('http://127.0.0.1:3000/users/sign_in');

//     // Fill in the login form
//     await page.fill('input[name="user[email]"]', 'playwright@test.com');
//     await page.fill('input[name="user[password]"]', 'playwrighttest');

//     await page.goto('http://127.0.0.1:3000/en');

//     const downloadLink = page.locator('text=Download');
//     await expect(downloadLink).toBeVisible();

//     // Optionally, intercept the download request
//     const [download] = await Promise.all([
//         page.waitForEvent('download'),
//         downloadLink.click(),
//     ]);

//     // Verify the downloaded file name
//     const fileName = await download.suggestedFilename();
//     expect(fileName).toContain('visa_application_form');
// });

// test('should display correct document statuses in the table', async ({ page }) => {
//     await page.goto('http://127.0.0.1:3000/en');

//     // Check for a specific document status
//     const documentStatus = page.locator('text=Not uploaded');
//     await expect(documentStatus).toBeVisible();
// });

// test('should navigate to more info page when clicking the link', async ({ page }) => {
//     await page.goto('http://127.0.0.1:3000/en');

//     const moreInfoLink = page.locator('text=More Info');
//     await moreInfoLink.click();

//     // Verify navigation to the correct page
//     await expect(page).toHaveURL(/\/pages\/new/);
// });

// test('should display content in the correct language', async ({ page }) => {
//   await page.goto('http://127.0.0.1:3000/cy'); // Welsh locale

//   const welshText = page.locator('text=Welsh content here'); // Replace with actual Welsh text
//   await expect(welshText).toBeVisible();
// });

