#!/bin/bash
CONTEXT=standby-eks
NAMESPACE=sock-shop
echo "⚙️ Scaling down standby region ($CONTEXT)..."
kubectl --context=$CONTEXT scale deployment frontend --replicas=0 -n $NAMESPACE
kubectl --context=$CONTEXT scale deployment backend --replicas=0 -n $NAMESPACE
echo "✅ Standby region rolled back. Resources idled."