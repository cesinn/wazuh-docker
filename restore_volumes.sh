#!/bin/bash
# Restauração dos volumes do Wazuh

VOLUMES=(
  single-node_wazuh-dashboard-config
  single-node_wazuh-indexer-data
  single-node_wazuh-manager-config
  single-node_wazuh-manager-data
)

for VOLUME in "${VOLUMES[@]}"; do
  echo ">> Restaurando volume: $VOLUME"
  docker volume create $VOLUME
  docker run --rm -v $VOLUME:/volume -v $(pwd)/volumes-backup:/backup alpine \
    sh -c "cd /volume && tar xzf /backup/$VOLUME.tar.gz --strip 1"
done

echo "✅ Restauração concluída!"
