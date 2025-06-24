#!/bin/bash
# Backup dos volumes Docker do Wazuh

VOLUMES=(
  single-node_wazuh-dashboard-config
  single-node_wazuh-indexer-data
  single-node_wazuh-manager-config
  single-node_wazuh-manager-data
)

mkdir -p ./volumes-backup

for VOLUME in "${VOLUMES[@]}"; do
  echo ">> Fazendo backup do volume: $VOLUME"
  docker run --rm -v $VOLUME:/volume -v $(pwd)/volumes-backup:/backup alpine \
    tar czf /backup/$VOLUME.tar.gz -C /volume .
done

echo "✅ Backup concluído. Arquivos salvos em ./volumes-backup/"
