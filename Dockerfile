FROM osrf/ros:melodic-desktop-full

COPY requirements.txt /requirements.txt

RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    tzdata \
    clang-tidy-6.0 \
    clang-tidy-7 \
    clang-tidy-8 \
    clang-tidy-9 \
    clang-tidy-10 \
    python3.7 \
    python3.7-dev \
    python3-pip && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
    pip3 install pip \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

COPY review.py /review.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
