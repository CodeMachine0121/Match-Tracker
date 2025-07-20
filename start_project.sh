#!/bin/bash
docker-compose up -d
docker-compose exec backend dotnet ef database update --project /src/ESportsMatchTracker.API


BASE_URL="http://localhost:5000/api/v1"

# --- 1. 創建一個 "scheduled" (已排程) 的比賽 ---
echo -e "\n\n Start Creating Data in DB"
echo "### Send Request：CreateScheduledMatch..."
curl -X POST "${BASE_URL}/match" \
-H "Content-Type: application/json" \
-d '{
  "game": "Valorant",
  "teamsJson": "[\"Team Alpha\",\"Team Omega\"]",
  "startTime": "2025-06-20T17:00:00Z",
  "status": "scheduled",
  "stage": "Group Stage",
  "tournament": "VCT Masters 2025",
  "streamUrl": "https://steamurl.com",
  "format": "Best of 3",
  "mapPoolJson": "[\"Ascent\",\"Bind\",\"Haven\"]",
  "scoreJson": null,
  "mapScoresJson": null,
  "currentMap": null,
  "winner": null,
  "operator": "James"
}'

echo -e "\n\n"

echo "### Send Request：CreateEndedMatch..."
curl -X POST "${BASE_URL}/match" \
-H "Content-Type: application/json" \
-d '{
  "game": "Valorant",
  "teamsJson": "[\"Team Alpha\",\"Team Omega\"]",
  "startTime": "2025-06-20T17:00:00Z",
  "status": "ended",
  "stage": "Group Stage",
  "tournament": "VCT Masters 2025",
  "streamUrl": "https://twitch.tv/vct",
  "format": "Best of 3",
  "mapPoolJson": "[\"Ascent\",\"Bind\",\"Haven\"]",
  "scoreJson": "{\"Team Alpha\":2,\"Team Omega\":0}",
  "mapScoresJson": "[{\"map\":\"Ascent\",\"score\":{\"Team Alpha\":13,\"Team Omega\":9}},{\"map\":\"Bind\",\"score\":{\"Team Alpha\":13,\"Team Omega\":8}}]",
  "currentMap": null,
  "winner": "Team Alpha",
  "operator": "James"
}'

echo -e "\n\n"

# --- 3. 創建一個 "live" (直播中) 的比賽 ---
echo "### Send Request：CreateLiveMatch..."
curl -X POST "${BASE_URL}/match" \
-H "Content-Type: application/json" \
-d '{
  "game": "Valorant",
  "teamsJson": "[\"Team Alpha\",\"Team Omega\"]",
  "startTime": "2025-06-20T17:00:00Z",
  "status": "live",
  "stage": "Group Stage",
  "tournament": "VCT Masters 2025",
  "streamUrl": "https://steamurl.com",
  "format": "Best of 3",
  "mapPoolJson": "[\"Ascent\",\"Bind\",\"Haven\"]",
  "scoreJson": "{\"Team Alpha\":1,\"Team Omega\":0}",
  "mapScoresJson": "[{\"map\":\"Ascent\",\"score\":{\"Team Alpha\":13,\"Team Omega\":9}},{\"map\":\"Bind\",\"score\":{\"Team Alpha\":4,\"Team Omega\":2}}]",
  "currentMap": "Bind",
  "winner": null,
  "operator": "James"
}'

echo -e "\n\n### Data is Created"
