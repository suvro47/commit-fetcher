FROM alpine:latest

# Install curl and jq
RUN apk add --no-cache curl jq

# Set the working directory inside the container
WORKDIR /app

# Copy the shell script into the container
COPY src/commit-fetcher.sh /app/commit-fetcher.sh

# Give execute permissions
RUN chmod +x commit-fetcher.sh

# Define the entrypoint to run the script
ENTRYPOINT ["sh", "commit-fetcher.sh"]
