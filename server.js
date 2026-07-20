import 'dotenv/config';
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import { testConnection } from './src/models/db.js';
import { getAllOrganizations } from './src/models/organizations.js';

// Define the application environment
const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'production'

// Define the port number the server will listen on
const PORT = process.env.PORT || 3000

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Ser EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(__dirname, 'src/views'));

/**
 * Configure Express middleware
 */

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

/**
 * Routes
 */
app.get('/', (req, res) => {
  res.render('index', { title: 'Home' });
});

app.get('/organizations', async (req, res) => {
  const organizations = await getAllOrganizations();
  const title = 'Organizations';
  res.render('organizations', { title, organizations });
});

app.get('/projects', (req, res) => {
  res.render('projects', { title: 'Projects' });
});

app.get('/categories', (req, res) => {
  res.render('categories', { title: 'Categories' });
});

app.listen(PORT, async() => {

  try {
    await testConnection();
    console.log(`Server listening at http://localhost:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
  } catch (error) {
    console.error(`Failed to start server: ${error.message}`);
    process.exit(1);
  }
});
