# Use the official FileBrowser image as base
FROM filebrowser/filebrowser:latest

# Set working directory
WORKDIR /app

# Copy configuration file for port 8300
COPY filebrowser.json /.filebrowser.json

# Create necessary directories and set permissions
RUN mkdir -p /srv /data && \
    chmod 755 /srv /data

# Create empty database file
RUN touch /database.db

# Create volumes for persistent data
VOLUME ["/srv", "/database.db"]

# Expose port 8300
EXPOSE 8300

# Set the entrypoint to use our custom config
ENTRYPOINT ["filebrowser", "--config", "/.filebrowser.json"]