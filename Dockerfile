FROM gitlab/dind

# Install kind (Kubernetes-in-Docker)
ARG KIND_VERSION="0.1.0"
RUN curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-linux-amd64 && \
    chmod +x kind && \
    mv kind /usr/local/bin/

# Set up the entrypoint.
ADD entrypoint.sh /usr/local/bin/wrapkind
ENTRYPOINT ["wrapkind"]
CMD ["sleep", "infinity"]