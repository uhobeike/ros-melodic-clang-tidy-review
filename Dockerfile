FROM osrf/ros:melodic-desktop-full

COPY requirements.txt /requirements.txt

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends\
    tzdata \
    clang-tidy-6.0 \
    clang-tidy-7 \
    clang-tidy-8 \
    clang-tidy-9 \
    clang-tidy-10 \
    python3.7 \
    python3.7 \
    python3.7 -m pip install pip \
    python3.7 -m install --upgrade pip && \
    python3.7 -m install -r requirements.txt

COPY review.py /review.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
