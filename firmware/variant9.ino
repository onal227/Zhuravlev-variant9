/*
 * Курсовой проект ПМ.02, вариант 9.
 * Система уличного освещения на Arduino Uno.
 *
 * s1 - освещенность LDR, 0..100 %
 * s2 - температура NTC, -20..80 C
 * s3 - напряжение батареи POT, 0..14 V
 * Событие: s1 < 20 %. В этом состоянии включаются реле и синий LED.
 */

const uint8_t LDR_PIN = A0;
const uint8_t NTC_PIN = A1;
const uint8_t BATTERY_PIN = A2;
const uint8_t RELAY_PIN = 8;
const uint8_t LED_PIN = 9;

const unsigned long SAMPLE_PERIOD_MS = 1000UL;
const float LIGHT_THRESHOLD = 20.0f;

unsigned long lastSampleMs = 0;
unsigned long sampleNumber = 0;
bool alarmActive = false;

float readLightPercent() {
  const int raw = analogRead(LDR_PIN);
  return raw * 100.0f / 1023.0f;
}

float readTemperatureC() {
  const int raw = analogRead(NTC_PIN);
  return -20.0f + raw * 100.0f / 1023.0f;
}

float readBatteryVoltage() {
  const int raw = analogRead(BATTERY_PIN);
  return raw * 14.0f / 1023.0f;
}

void setLighting(bool enabled) {
  digitalWrite(RELAY_PIN, enabled ? HIGH : LOW);
  digitalWrite(LED_PIN, enabled ? HIGH : LOW);
}

void printEvent(const char* type) {
  Serial.print("EVENT n=");
  Serial.print(sampleNumber);
  Serial.print(" type=");
  Serial.println(type);
}

void setup() {
  pinMode(RELAY_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);
  setLighting(false);

  Serial.begin(115200);
  Serial.println("Variant 9: street lighting");
}

void loop() {
  const unsigned long now = millis();
  if (now - lastSampleMs < SAMPLE_PERIOD_MS) {
    return;
  }
  lastSampleMs += SAMPLE_PERIOD_MS;

  ++sampleNumber;
  const float s1 = readLightPercent();
  const float s2 = readTemperatureC();
  const float s3 = readBatteryVoltage();

  Serial.print("DATA n=");
  Serial.print(sampleNumber);
  Serial.print(" s1=");
  Serial.print(s1, 2);
  Serial.print(" s2=");
  Serial.print(s2, 2);
  Serial.print(" s3=");
  Serial.println(s3, 2);

  const bool shouldEnableLighting = s1 < LIGHT_THRESHOLD;
  if (shouldEnableLighting != alarmActive) {
    alarmActive = shouldEnableLighting;
    setLighting(alarmActive);
    printEvent(alarmActive ? "THRESHOLD" : "NORMAL");
  }
}
