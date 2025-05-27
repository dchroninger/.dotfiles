#include "../sketchybar.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main (int argc, char** argv) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    fprintf(stderr, "Usage: %s \"<event-name>\" \"<update_freq>\"\n", argv[0]);
    exit(1);
  }
  
  char *event_name = argv[1];

  // Setup the event in SketchyBar
  char event_message[512];
  snprintf(event_message, sizeof(event_message), "--add event '%s'", event_name);
  sketchybar(event_message);

  char trigger_message[512];
  char result[1024] = {0};

  // Simplified AppleScript command: just return the current track details.
  const char *applescript = "osascript -e 'tell application \"Music\" to get name of current track & \" - \" & artist of current track'";

  for (;;) {
    FILE *fp = popen(applescript, "r");
    if (!fp) {
      perror("popen");
      exit(1);
    }
    result[0] = '\0';
    while (fgets(result, sizeof(result), fp) != NULL) {
      /* accumulate output into result */
    }
    pclose(fp);

    // Remove trailing newline if present.
    size_t len = strlen(result);
    if (len > 0 && result[len-1] == '\n') {
      result[len-1] = '\0';
    }

    // Debug output to stderr.
    fprintf(stderr, "nowplaying_update: result = [%s]\n", result);

    // Trigger the event with the nowplaying property.
    snprintf(trigger_message, sizeof(trigger_message), "--trigger '%s' nowplaying='%s'", event_name, result);
    sketchybar(trigger_message);

    usleep((int)(update_freq * 1000000));
  }
  
  return 0;
}
