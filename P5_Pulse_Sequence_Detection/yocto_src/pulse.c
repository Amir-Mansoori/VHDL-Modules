#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

void wait_ms(int ms) {
    usleep(ms * 1000);
}

void export_gpio(int gpio) {
    int fd;
    char buffer[64];
    
    fd = open("/sys/class/gpio/export", O_WRONLY);
    if (fd < 0) {
        perror("Error exporting GPIO");
        exit(EXIT_FAILURE);
    }
    
    snprintf(buffer, sizeof(buffer), "%d", gpio);
    write(fd, buffer, strlen(buffer));
    close(fd);
}

void unexport_gpio(int gpio) {
    int fd;
    char buffer[64];
    
    fd = open("/sys/class/gpio/unexport", O_WRONLY);
    if (fd < 0) {
        perror("Error unexporting GPIO");
        exit(EXIT_FAILURE);
    }
    
    snprintf(buffer, sizeof(buffer), "%d", gpio);
    write(fd, buffer, strlen(buffer));
    close(fd);
}

void set_gpio_direction(int gpio, const char* direction) {
    int fd;
    char path[64];
    
    snprintf(path, sizeof(path), "/sys/class/gpio/gpio%d/direction", gpio);
    fd = open(path, O_WRONLY);
    if (fd < 0) {
        perror("Error setting GPIO direction");
        exit(EXIT_FAILURE);
    }
    
    write(fd, direction, strlen(direction));
    close(fd);
}

void set_gpio_value(int gpio, int value) {
    int fd;
    char path[64];
    
    snprintf(path, sizeof(path), "/sys/class/gpio/gpio%d/value", gpio);
    fd = open(path, O_WRONLY);
    if (fd < 0) {
        perror("Error setting GPIO value");
        exit(EXIT_FAILURE);
    }
    
    dprintf(fd, "%d", value);
    close(fd);
}

int main() {
    const int gpio = 1023;  // Replace with the correct GPIO number
    printf("Exporting GPIO %d\n", gpio);
    export_gpio(gpio);

    printf("Setting GPIO %d direction to output\n", gpio);
    set_gpio_direction(gpio, "out");

    printf("Finish configurations\n");
    wait_ms(5000);  // wait for 5 seconds

    printf("Starting the loop with 4 iterations\n");
    for (int j = 0; j < 4; j++) {
        printf("iteration = %d\n", j);

        set_gpio_value(gpio, 1);
        printf("Pulse_in is 1\n");
        wait_ms(150);
        printf("wait for 150 ms\n");

        set_gpio_value(gpio, 0);
        printf("Pulse_in is 0\n");
        wait_ms(180);
        printf("wait for 180 ms\n");

        set_gpio_value(gpio, 1);
        printf("Pulse_in is 1\n");
        wait_ms(50);
        printf("wait for 50 ms\n");

        set_gpio_value(gpio, 0);
        printf("Pulse_in is 0\n");
        wait_ms(2000);
        printf("wait for 2 seconds\n");

        set_gpio_value(gpio, 1);
        printf("Pulse_in is 1\n");
        wait_ms(100);
        printf("wait for 100 ms\n");

        set_gpio_value(gpio, 0);
        printf("Pulse_in is 0\n");
    }

    printf("Releasing GPIO %d\n", gpio);
    unexport_gpio(gpio);

    return 0;
}

