# Use the official Golang image to create a build artifact.
FROM golang:1.18 as builder

# Set the working directory inside the container.
WORKDIR /app

# Copy go mod files and download dependencies.
COPY go.mod ./
RUN go mod download

# Copy the source code into the container's work directory.
COPY . .

# Build the application. Disable CGO and compile for Linux.
RUN CGO_ENABLED=0 GOOS=linux go build -v -o server

# Use a lightweight Docker image (scratch) for running the app.
FROM scratch

# Copy the compiled binary from the builder stage.
COPY --from=builder /app/server /server

# Expose port 8080 for the application.
EXPOSE 8080

# Command to run the binary.
ENTRYPOINT ["/server"]
