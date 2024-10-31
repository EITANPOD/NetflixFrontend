# Base image with Node.js 14
FROM node:14

# Create and set working directory
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variable for the Movie Catalog Service
# Replace the URL with the actual service URL as needed
ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Build the project
RUN npm run build

# Expose port (use the port your app runs on, e.g., 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
